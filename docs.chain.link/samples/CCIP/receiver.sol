// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {Client} from "@chainlink/contracts-ccip@1.5.0/src/v0.8/ccip/libraries/Client.sol";
import {CCIPReceiver} from "@chainlink/contracts-ccip@1.5.0/src/v0.8/ccip/applications/CCIPReceiver.sol";

contract Receiver is CCIPReceiver {
    struct PatientInfo {
        string patientName;
        uint256 patientAge;
        string bloodGroup;
        string medicalHistory;
        uint256 timestamp;
    }

    bytes32 private s_lastReceivedMessageId;
    PatientInfo private s_lastReceivedPatientInfo;

    event MessageReceived(
        bytes32 indexed messageId,
        uint64 indexed sourceChainSelector,
        address sender,
        PatientInfo patientInfo
    );

    constructor(address router) CCIPReceiver(router) {}

    function _ccipReceive(
        Client.Any2EVMMessage memory any2EvmMessage
    ) internal override {
        s_lastReceivedMessageId = any2EvmMessage.messageId;
        s_lastReceivedPatientInfo = abi.decode(any2EvmMessage.data, (PatientInfo));

        emit MessageReceived(
            any2EvmMessage.messageId,
            any2EvmMessage.sourceChainSelector,
            abi.decode(any2EvmMessage.sender, (address)),
            s_lastReceivedPatientInfo
        );
    }

    function getLastReceivedMessageDetails()
        external
        view
        returns (bytes32 messageId, PatientInfo memory patientInfo)
    {
        return (s_lastReceivedMessageId, s_lastReceivedPatientInfo);
    }
}
