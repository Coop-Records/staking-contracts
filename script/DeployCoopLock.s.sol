// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../contracts/CoopLockToken.sol";

contract DeployCoopLock is Script {
    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        // DEGEN token address: 0x4ed4E862860beD51a9570b96d89aF5E1B0Efefed
        // IJN (base mainnet): 0x2Da1F02de055Cebe51c6f6526ed67Ad0dc86f431
        address degenToken = 0x2Da1F02de055Cebe51c6f6526ed67Ad0dc86f431;

        vm.startBroadcast(deployerPrivateKey);

        CoopLockToken lockToken = new CoopLockToken(degenToken, "Locked IJN", "LIJN");

        vm.stopBroadcast();

        console.log("CoopLockToken deployed to:", address(lockToken));
        console.log("Locked token:", address(lockToken.TOKEN()));
        console.log("Name:", lockToken.name());
        console.log("Symbol:", lockToken.symbol());
    }
}
