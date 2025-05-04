# 📚 Lisk Africa Developer’s Bootcamp – Week 3 Assignment

## 🗳️ Build a Decentralized Voting System

### 📝 Assignment Overview

Build a simple voting smart contract that lets users:

- Register candidates
- Vote for candidates
- View election results

### ✅ Requirements

The smart contract must demonstrate the following Solidity concepts:

- `struct` to define a `Candidate`
- `mapping` to store candidates and votes
- Proper use of `storage`, `memory`, and `calldata`
- Inheritance to organize functionality into base and derived contracts

---

## 1. 🧱 Structs and Mappings

### Define a `Candidate` struct with:
- `uint id`
- `string name`
- `uint voteCount`

### Mappings:
- `mapping(uint => Candidate)` to store candidates by ID
- `mapping(address => bool)` to track which addresses have voted

---

## 2. 🧮 Functions

### `addCandidate(string calldata name)`
- Only callable by the contract **owner**
- Adds a new candidate to the list

### `vote(uint candidateId)`
- Allows an address to vote for a candidate
- Prevents double voting using the `voters` mapping

### `getCandidate(uint candidateId) public view returns (string memory name, uint voteCount)`
- Returns a candidate’s details using proper memory allocation

### `getTotalCandidates() public view returns (uint)`
- Returns the total number of registered candidates

---

## 3. 🧬 Inheritance

- Create a base contract `Ownable` that stores the owner and includes a `modifier onlyOwner`
- Inherit from `Ownable` in the `VotingSystem` contract
