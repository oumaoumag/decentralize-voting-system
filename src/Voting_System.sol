// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// Base contract that handles ownership functionality
contract Ownable {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    // Restricts function access to owner only
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this.");
        _;
    }
}

// Main voting contract that inherits from Ownable
contract VotingSystem is Ownable {
    // Candidate struct as required in the instructions
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    // Mapping to store candidates by ID
    mapping(uint => Candidate) public candidates;
    // Mapping to track which addresses have voted
    mapping(address => bool) public voters;
    // Counter for total candidates
    uint public candidateCount;
    
    // Events to track voting activity
    event CandidateAdded(uint id, string name);
    event VoteCast(address voter, uint candidateId);

    // Adds a new candidate to the election
    function addCandidate(string calldata name) external onlyOwner {
        candidates[candidateCount] = Candidate(candidateCount, name, 0);
        emit CandidateAdded(candidateCount, name);
        candidateCount++;
    }

    // Allows a user to vote for a candidate
    function vote(uint candidateId) external {
        require(!voters[msg.sender], "You have already voted.");
        require(candidateId < candidateCount, "Candidate does not exist.");

        voters[msg.sender] = true;
        candidates[candidateId].voteCount++;
        emit VoteCast(msg.sender, candidateId);
    }

    // Returns a candidate's details
    function getCandidate(uint candidateId) public view returns (string memory name, uint voteCount) {
        require(candidateId < candidateCount, "Candidate does not exist.");
        Candidate memory candidate = candidates[candidateId];
        return (candidate.name, candidate.voteCount);
    }

    // Returns the total number of candidates
    function getTotalCandidates() public view returns (uint) {
        return candidateCount;
    }
}
