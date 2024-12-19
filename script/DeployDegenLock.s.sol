// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../contracts/DegenLockToken.sol";

contract DeployDegenLock is Script {
    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(deployerPrivateKey);

        address defaultToken = 0x4ed4E862860beD51a9570b96d89aF5E1B0Efefed;
        DegenLockToken degenLock = new DegenLockToken(defaultToken);

        vm.stopBroadcast();

        console.log("DegenLockToken deployed to:", address(degenLock));
    }
}
