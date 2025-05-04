# Decentralized Voting System

A blockchain-based voting system built for the Lisk Africa Developer's Bootcamp (Week 3 Assignment). This smart contract allows for secure, transparent voting with candidate registration and vote tracking.

## Project Overview

This decentralized voting application enables:
- Registration of candidates (by the contract owner)
- Secure voting for registered candidates
- Prevention of double voting
- Transparent view of election results

## Smart Contract Details

The project consists of two main contracts:
- `Ownable`: A base contract that handles ownership functionality
- `VotingSystem`: The main contract that inherits from Ownable and implements voting functionality

### Key Features

- Candidate management with struct-based storage
- Vote tracking using address mapping
- Events for tracking voting activity
- Access control for candidate registration
- Prevention of double voting

## Deployment Information

The contract has been deployed to:

- **Lisk Sepolia Testnet**: [0x055A00d73Cb313eA5f1c99EF12e01DDe08a9FAFf](https://sepolia-blockscout.lisk.com/address/0x055A00d73Cb313eA5f1c99EF12e01DDe08a9FAFf)
- **Transaction Hash**: [0x8408170df661a10e64c510c7a149b79d91b21d95924f7fcc8630583cda086539](https://sepolia-blockscout.lisk.com/tx/0x8408170df661a10e64c510c7a149b79d91b21d95924f7fcc8630583cda086539)

## Development Tools

This project uses [Foundry](https://book.getfoundry.sh/) for development, testing, and deployment.

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Deploy

To deploy to Lisk Sepolia testnet:

```shell
$ forge create src/Voting_System.sol:VotingSystem --rpc-url https://rpc.sepolia-api.lisk.com --private-key $PRIVATE_KEY --broadcast
```

For local development with Anvil:

```shell
$ anvil
$ forge create src/Voting_System.sol:VotingSystem --rpc-url http://localhost:8545 --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 --broadcast
```

## Interacting with the Contract

### Adding a Candidate (Owner Only)

```shell
$ cast send 0x055A00d73Cb313eA5f1c99EF12e01DDe08a9FAFf "addCandidate(string)" "Candidate Name" --rpc-url https://rpc.sepolia-api.lisk.com --private-key $PRIVATE_KEY
```

### Voting for a Candidate

```shell
$ cast send 0x055A00d73Cb313eA5f1c99EF12e01DDe08a9FAFf "vote(uint256)" 0 --rpc-url https://rpc.sepolia-api.lisk.com --private-key $PRIVATE_KEY
```

### Getting Candidate Information

```shell
$ cast call 0x055A00d73Cb313eA5f1c99EF12e01DDe08a9FAFf "getCandidate(uint256)" 0 --rpc-url https://rpc.sepolia-api.lisk.com
```

### Getting Total Candidates

```shell
$ cast call 0x055A00d73Cb313eA5f1c99EF12e01DDe08a9FAFf "getTotalCandidates()" --rpc-url https://rpc.sepolia-api.lisk.com
```
