# HealthBridge - Cross-Chain Medical Data Transfer System

## Description
HealthBridge is an innovative blockchain solution that enables secure and efficient transfer of patient medical data across different blockchain networks. Built using Chainlink's Cross-Chain Interoperability Protocol (CCIP), this system allows seamless communication between smart contracts deployed on Avalanche Fuji and Ethereum Sepolia networks. The project demonstrates how healthcare providers can share critical patient information while maintaining data integrity and security across different blockchain ecosystems.

The system consists of two main components: a sender contract deployed on Avalanche Fuji that initiates the data transfer, and a receiver contract on Ethereum Sepolia that receives and stores the patient information. This architecture showcases the potential of cross-chain communication in healthcare, enabling real-time sharing of medical records between different blockchain-based healthcare systems.

![CCIP Diagram](https://github.com/Rahul1227/HealthBridge/blob/main/pictures/ccip-diagram-04_v04.webp)

## Problem Statement
In the current Web3 healthcare landscape, medical data exists in silos across different blockchain networks, making it challenging for healthcare providers to access complete patient histories. HealthBridge addresses this critical issue by creating a bridge between hospitals operating on different blockchains. This solution enables healthcare providers to share patient information securely and efficiently, ensuring better patient care through comprehensive access to medical records, regardless of which blockchain network the data originates from.

## Features

- **Cross-Chain Data Transfer**: Secure transmission of patient data between Avalanche Fuji and Ethereum Sepolia networks
- **Structured Data Management**: Organized storage and retrieval of patient information using standardized data structures
- **Real-Time Updates**: Immediate synchronization of patient records across networks
- **Security Controls**: Implementation of owner-only access and secure message handling
- **Event Tracking**: Comprehensive event logging for all cross-chain transactions
- **Data Verification**: Built-in mechanisms to verify successful data transmission

### Sender Contract
- Initiates cross-chain medical data transfer
- Handles LINK token fees
- Manages message encoding and sending
- Emits tracking events

### Receiver Contract
- Receives cross-chain medical data
- Decodes patient information
- Stores structured data
- Provides data retrieval functions

## Patient Data Structure

```solidity
struct PatientInfo {
    string patientName;
    uint256 patientAge;
    string bloodGroup;
    string medicalHistory;
    uint256 timestamp;
}
```

## Project Structure
```
HealthBridge/
├── .deps/
│   └── ...
├── docs.chain.link/
│   └── samples/
│       └── CCIP/
│           ├── artifacts/
│           │   └── build-info/
│           │       ├── Receiver.json
│           │       ├── Receiver_metadata.json
│           │       ├── Sender.json
│           │       └── Sender_metadata.json
│           ├── receiver.sol        # The receiver contract deployed at Ethereum Sepolia
│           │
│           └── sender.sol          # The sender contract deployed at Avalanche Fuji
├── pictures/
│   
└── README.md                        # Project documentation and setup guide
```
## Prerequisites

### Development Tools
- Solidity programming language knowledge
- MetaMask wallet installed and configured
- Remix IDE for smart contract development and deployment

### Network Requirements
- Avalanche Fuji testnet configured in MetaMask
- Ethereum Sepolia testnet configured in MetaMask

### Required Testnet Tokens
1. For Avalanche Fuji:
   - Testnet AVAX for gas fees
   - Testnet LINK for CCIP fees

2. For Ethereum Sepolia:
   - Testnet ETH for gas fees

### Token Acquisition
1. Visit [Chainlink Faucet](https://faucets.chain.link) to obtain:
   - Testnet LINK tokens
   - Testnet AVAX tokens
   - Testnet ETH tokens

### Network Configurations
- Avalanche Fuji
  - RPC URL: https://api.avax-test.network/ext/bc/C/rpc
  - Chain ID: 43113
  - Currency Symbol: AVAX

- Ethereum Sepolia
  - RPC URL: https://rpc.sepolia.org
  - Chain ID: 11155111
  - Currency Symbol: ETH

## Implementation

### Deploying Sender.sol

1. **Contract Setup in Remix**
   - Open [Remix IDE](https://remix.ethereum.org/) in one browser
   - Import the [code](https://github.com/Rahul1227/HealthBridge) in Remix IDE and open Sender.sol
   - Navigate to the compiler tab and compile the contract

3. **Network Configuration**
   - Open MetaMask wallet
   - Select Avalanche Fuji testnet
   - Ensure you have sufficient AVAX for deployment

4. **Deployment Settings**
   - In Remix, go to "Deploy & Run Transactions" tab
     <div align="left">
      <img src="https://github.com/Rahul1227/HealthBridge/blob/main/pictures/deploy-sender-avalanche-fuji.webp" width="550" height="700">
    </div>



   - Select "Injected Provider - MetaMask" as environment
   - Enter the following contract parameters:<br>
      Router Address:
     ```
     0xF694E193200268f9a4868e4Aa017A0118C9a8177
     ```
     LINK Address:
     ```
      0x0b9d5D9136855f6FEc3c0993feE6E9CE8a297846
     ```

5. **Contract Deployment**
   - Click "Deploy" button
   - Confirm the transaction in MetaMask
   - Verify deployment on Avalanche Fuji network
   - Save the deployed contract address

6. **Fund Contract**
   - Send 70 LINK tokens to the deployed contract address
   - This covers CCIP fees for cross-chain operations
   - Additional LINK can be obtained from [Chainlink Faucet](https://faucets.chain.link)

7. **Verification**
   - Confirm contract deployment on Avalanche Fuji explorer
   - Verify LINK token balance in the contract
   - Contract is now ready for cross-chain operations

### Deploying Receiver.sol

1. **Contract Setup in Remix**
   - Open [Remix IDE](https://remix.ethereum.org/) in another browser
   - Import the [code](https://github.com/Rahul1227/HealthBridge) in Remix IDE and open Receiver.sol
   - Compile the contract with Solidity version 0.8.24

2. **Network Configuration**
   - Open MetaMask wallet
   - Switch to Ethereum Sepolia network
   - Ensure sufficient ETH balance for deployment

3. **Deployment Settings**
   - Access "Deploy & Run Transactions" tab in Remix
  <div align="left">
  <img src="https://github.com/Rahul1227/HealthBridge/blob/main/pictures/deploy-receiver-sepolia.webp" width="550" height="600">
</div>

   - Select "Injected Provider - MetaMask"
   - Enter the router address:<br>
     Router Address:
     ```
     0x0BF3dE8c5D3e8A2B34D2BEeB17ABfCeBaf363A59
     ```

4. **Contract Deployment**
   - Click "Deploy" button
   - Confirm deployment transaction in MetaMask
   - Verify you're deploying to Ethereum Sepolia
   - Save the deployed contract address

5. **Deployment Verification**
   - Confirm contract appears in Deployed Contracts list
   - Copy and save the contract address
   - Verify deployment on Sepolia block explorer

### Sending Patient Data Cross-Chain

1. **Network Setup**
   - Open MetaMask
   - Select Avalanche Fuji network
   - Access deployed contracts in Remix

2. **Prepare Transaction**
   - Expand Deployed Contracts section
   - Locate sendMessage function
   - Fill in the following parameters:
     ```
     destinationChainSelector: 16015286601757825753  // Ethereum Sepolia chain ID
     receiver: [Your Deployed Receiver Contract Address]
     patientInfo: {
         patientName: <Name>,
         patientAge: <Age>,
         bloodGroup: <Blood group>,
         medicalHistory: <Findings on examination>,
         timestamp: [Current Unix Timestamp]
     }
     ```
     <div align="left">
      <img src="https://github.com/Rahul1227/HealthBridge/blob/main/pictures/filling-info-in-sender.png" width="400" height="550">
    </div>


3. **Execute Transfer**
   - Click "transact" button
   - Confirm transaction in MetaMask
   - Save transaction hash for tracking

4. **Monitor Transaction**
   - Wait for source chain confirmation
   - Allow 3-5 minutes for CCIP processing
   - Track status using [CCIP Explorer](https://ccip.chain.link)

5. **Transaction Monitoring**
   - Input transaction hash in CCIP Explorer
   - Monitor cross-chain progress
   - Verify successful data delivery
    <div align="left">
  <img src="https://github.com/Rahul1227/HealthBridge/blob/main/pictures/ccip-explorer-tx-details.webp" width="650" height="700">
</div>


6. **Gas Considerations**
   - Keep extra LINK tokens for gas spikes
   - Recommended balance: 70+ LINK tokens
   - Additional LINK available at faucets.chain.link

7. **Success Verification**
   - Check "Success" status in CCIP Explorer
   - Verify data on Ethereum Sepolia
   - Confirm patient data in receiver contract
     <div align="left">
  <img src="https://github.com/Rahul1227/HealthBridge/blob/main/pictures/ccip-explorer-tx-details-success.webp" width="650" height="700">
</div>
  
### Reading Patient Data from Receiver Contract

1. **Access Receiver Contract**
   - Open MetaMask
   - Select Ethereum Sepolia network
   - Navigate to Remix IDE's "Deploy & Run Transactions" tab
   - Locate your deployed receiver contract

2. **View Patient Information**
   - Click `getLastReceivedMessageDetails()`
   - Returns two values:
     ```solidity
     messageId: [unique CCIP message identifier]
     patientInfo: {
         patientName: "Patient Name",
         patientAge: [age in years],
         bloodGroup: "Blood Type",
         medicalHistory: "Medical History Details",
         timestamp: [transfer timestamp]
     }
     ```
     <div align="left">
      <img src="https://github.com/Rahul1227/HealthBridge/blob/main/pictures/receiving%20same%20info.png" width="400" height="550">
    </div>
     

3. **Data Verification**
   - Confirm message ID matches the sent transaction
   - Verify all patient details are correctly transferred
   - Check timestamp for transfer time

The successful data retrieval confirms the complete cross-chain transfer of patient information using Chainlink's CCIP protocol. Your medical data bridge is now fully operational between Avalanche Fuji and Ethereum Sepolia networks.

## Conclusion

HealthBridge successfully demonstrates secure cross-chain medical data transfer using Chainlink's CCIP protocol. The system enables:

- Seamless patient data sharing between Avalanche Fuji and Ethereum Sepolia networks
- Structured storage and retrieval of medical information
- Real-time cross-chain updates with transaction verification
- Secure and efficient healthcare data management

The implementation provides a foundation for blockchain-based healthcare interoperability, allowing medical institutions to share patient data while maintaining security and data integrity across different networks.

### Future Scope
- Integration with additional blockchain networks
- Enhanced data encryption mechanisms
- Advanced patient data management features
- Automated compliance and audit trails

For detailed setup and usage instructions, refer to the implementation sections above.

### Resources
- [Chainlink CCIP Documentation](https://docs.chain.link/ccip)
- [Project Repository](https://github.com/Rahul1227/HealthBridge)
- [CCIP Explorer](https://ccip.chain.link)




