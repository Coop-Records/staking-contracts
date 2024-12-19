// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../contracts/DegenLockToken.sol";

contract DeployDegenLock is Script {
    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(deployerPrivateKey);

        DegenLockToken degenLock = new DegenLockToken();

        vm.stopBroadcast();

        console.log("DegenLockToken deployed to:", address(degenLock));
    }
}
