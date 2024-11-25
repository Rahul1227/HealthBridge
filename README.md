# HealthBridge - Cross-Chain Medical Data Transfer System

## Description
HealthBridge is an innovative blockchain solution that enables secure and efficient transfer of patient medical data across different blockchain networks. Built using Chainlink's Cross-Chain Interoperability Protocol (CCIP), this system allows seamless communication between smart contracts deployed on Avalanche Fuji and Ethereum Sepolia networks. The project demonstrates how healthcare providers can share critical patient information while maintaining data integrity and security across different blockchain ecosystems.

The system consists of two main components: a sender contract deployed on Avalanche Fuji that initiates the data transfer, and a receiver contract on Ethereum Sepolia that receives and stores the patient information. This architecture showcases the potential of cross-chain communication in healthcare, enabling real-time sharing of medical records between different blockchain-based healthcare systems.

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
├── blockchain-voting-dapp 
.deps/
└── npm/
    └── @chainlink/
docs.chain.link/
└── samples/
    └── CCIP/
        ├── artifacts/
        │   └── build-info/
        │       ├── Sender.json
        │       ├── Sender_metadata.json
        │       ├── Receiver.json
        │       └── Receiver_metadata.json
        ├── receiver.sol   # The receiver contract deployed at Ethereum Sepolia
        ├── sender.sol     # The sender contract deployed at Avalanche Fuji
        └── README.md      # Project documentation and setup guide
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
   - Select "Injected Provider - MetaMask" as environment
   - Enter the following contract parameters:
     ```
     Router Address: 0xF694E193200268f9a4868e4Aa017A0118C9a8177
     LINK Address: 0x0b9d5D9136855f6FEc3c0993feE6E9CE8a297846
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
   - Select "Injected Provider - MetaMask"
   - Enter the router address:
     ```
     Router Address: 0x0BF3dE8c5D3e8A2B34D2BEeB17ABfCeBaf363A59
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




