// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {VotingSystem} from "../src/Voting_System.sol";

contract VotingSystemTest is Test {
    VotingSystem public votingSystem;
    address public owner;
    address public voter1;
    address public voter2;

    function setUp() public {
        owner = address(this);
        voter1 = makeAddr("voter1");
        voter2 = makeAddr("voter2");
        
        votingSystem = new VotingSystem();
    }

    function testOwnerCanAddCandidate() public {
        votingSystem.addCandidate("Alice");
        (string memory name, uint voteCount) = votingSystem.getCandidate(0);

        assertEq(name, "Alice");
        assertEq(voteCount, 0);
    }

    function testNonOwnerCannotAddCandidate() public {
        vm.prank(voter1);
        vm.expectRevert("Only owner can call this.");
        votingSystem.addCandidate("Bob");
    }

    function testUserCanVote() public {
        votingSystem.addCandidate("Alice");

        vm.prank(voter1);
        votingSystem.vote(0);
        
        (, uint voteCount) = votingSystem.getCandidate(0);
        assertEq(voteCount, 1);
    }

    function testCannotDoubleVote() public {
        votingSystem.addCandidate("Alice");

        vm.prank(voter1);
        votingSystem.vote(0);
        
        vm.prank(voter1);
        vm.expectRevert("You have already voted.");
        votingSystem.vote(0);
    }

    function testCorrectTotalCandidates() public {
        votingSystem.addCandidate("Alice");
        votingSystem.addCandidate("Bob");

        uint total = votingSystem.getTotalCandidates();
        assertEq(total, 2);
    }

    function testCannotVoteForNonExistentCandidate() public {
        vm.prank(voter1);
        vm.expectRevert("Candidate does not exist.");
        votingSystem.vote(5);
    }

    function testCannotGetNonExistentCandidate() public {
        vm.expectRevert("Candidate does not exist.");
        votingSystem.getCandidate(0);
    }
}