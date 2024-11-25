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
