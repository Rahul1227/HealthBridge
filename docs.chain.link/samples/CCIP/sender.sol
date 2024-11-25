// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {IRouterClient} from "@chainlink/contracts-ccip@1.5.0/src/v0.8/ccip/interfaces/IRouterClient.sol";
import {OwnerIsCreator} from "@chainlink/contracts-ccip@1.5.0/src/v0.8/shared/access/OwnerIsCreator.sol";
import {Client} from "@chainlink/contracts-ccip@1.5.0/src/v0.8/ccip/libraries/Client.sol";
import {LinkTokenInterface} from "@chainlink/contracts@1.2.0/src/v0.8/shared/interfaces/LinkTokenInterface.sol";

contract Sender is OwnerIsCreator {
    error NotEnoughBalance(uint256 currentBalance, uint256 calculatedFees);

    struct PatientInfo {
        string patientName;
        uint256 patientAge;
        string bloodGroup;
        string medicalHistory;
        uint256 timestamp;
    }

    event MessageSent(
        bytes32 indexed messageId,
        uint64 indexed destinationChainSelector,
        address receiver,
        PatientInfo patientInfo,
        address feeToken,
        uint256 fees
    );

    IRouterClient private s_router;
    LinkTokenInterface private s_linkToken;

    constructor(address _router, address _link) {
        s_router = IRouterClient(_router);
        s_linkToken = LinkTokenInterface(_link);
    }

    function sendMessage(
        uint64 destinationChainSelector,
        address receiver,
        string calldata patientName,
        uint256 patientAge,
        string calldata bloodGroup,
        string calldata medicalHistory
    ) external onlyOwner returns (bytes32 messageId) {
        PatientInfo memory patient = PatientInfo({
            patientName: patientName,
            patientAge: patientAge,
            bloodGroup: bloodGroup,
            medicalHistory: medicalHistory,
            timestamp: block.timestamp
        });

        Client.EVM2AnyMessage memory evm2AnyMessage = Client.EVM2AnyMessage({
            receiver: abi.encode(receiver),
            data: abi.encode(patient),
            tokenAmounts: new Client.EVMTokenAmount[](0),
            extraArgs: Client._argsToBytes(
                Client.EVMExtraArgsV2({
                    gasLimit: 200_000,
                    allowOutOfOrderExecution: true
                })
            ),
            feeToken: address(s_linkToken)
        });

        uint256 fees = s_router.getFee(
            destinationChainSelector,
            evm2AnyMessage
        );

        if (fees > s_linkToken.balanceOf(address(this)))
            revert NotEnoughBalance(s_linkToken.balanceOf(address(this)), fees);

        s_linkToken.approve(address(s_router), fees);

        messageId = s_router.ccipSend(destinationChainSelector, evm2AnyMessage);

        emit MessageSent(
            messageId,
            destinationChainSelector,
            receiver,
            patient,
            address(s_linkToken),
            fees
        );

        return messageId;
    }
}
