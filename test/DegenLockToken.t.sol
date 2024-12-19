// SPDX-License-Identifier: LGPL-3.0-only
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../contracts/DegenLockToken.sol";

contract DegenLockTokenTest is Test {
    DegenLockToken public lockToken;
    address public user = address(0x1);
    address public constant DEFAULT_TOKEN =
        0x4ed4E862860beD51a9570b96d89aF5E1B0Efefed;
    address public constant CUSTOM_TOKEN = address(0x2);

    function setUp() public {
        // Deploy the lock token contract with default token (address(0))
        lockToken = new DegenLockToken(address(0));
    }

    function test_InitialState() public {
        assertEq(lockToken.name(), "Locked Degen");
        assertEq(lockToken.symbol(), "LDEGEN");
        assertEq(lockToken.lockDuration(), 90 days);
        assertEq(lockToken.minDepositAmount(), 1e22);
        assertEq(
            address(lockToken.TOKEN()),
            DEFAULT_TOKEN,
            "Token address should match default value"
        );
    }

    function test_CustomTokenAddress() public {
        DegenLockToken customLockToken = new DegenLockToken(CUSTOM_TOKEN);
        assertEq(
            address(customLockToken.TOKEN()),
            CUSTOM_TOKEN,
            "Token address should match custom value"
        );
    }

    function test_ReduceLockDuration() public {
        uint256 newDuration = 30 days;
        lockToken.reduceLockDuration(newDuration);
        assertEq(lockToken.lockDuration(), newDuration);
    }

    function test_ReduceLockDurationNotOwner() public {
        uint256 newDuration = 30 days;
        vm.prank(user);
        vm.expectRevert();
        lockToken.reduceLockDuration(newDuration);
    }

    function test_UpdateMinDepositAmount() public {
        uint256 newMinDeposit = 2e22;
        lockToken.updateMinDepositAmount(newMinDeposit);
        assertEq(lockToken.minDepositAmount(), newMinDeposit);
    }
}
