// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {VotingSystem} from "../src/Voting_System.sol";

contract DeployVotingSystem is Script {
    function setUp() public {}

    function run() public {
        // Get private key from environment
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        // Get RPC URL from environment (optional, can be passed via command line)
        string memory rpcUrl = vm.envOr("LISK_SEPOLIA_RPC_URL", string(""));

        // Log deployment information
        console.log("Deploying VotingSystem contract...");
        if (bytes(rpcUrl).length > 0) {
            console.log("Using RPC URL from environment variable");
        } else {
            console.log("No RPC URL found in environment, make sure to provide it via --rpc-url flag");
        }

        // Start broadcasting transactions with the private key
        vm.startBroadcast(deployerPrivateKey);

        // Deploy the VotingSystem contract
        VotingSystem votingSystem = new VotingSystem();

        // Log the deployment address
        console.log("VotingSystem deployed to:", address(votingSystem));

        // Stop broadcasting transactions
        vm.stopBroadcast();
    }
}
