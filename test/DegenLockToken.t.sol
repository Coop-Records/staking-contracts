// SPDX-License-Identifier: LGPL-3.0-only
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../contracts/DegenLockToken.sol";

contract DegenLockTokenTest is Test {
    DegenLockToken public lockToken;
    address public user = address(0x1);

    function setUp() public {
        // Deploy the lock token contract
        lockToken = new DegenLockToken();
    }

    function test_InitialState() public {
        assertEq(lockToken.name(), "Locked Degen");
        assertEq(lockToken.symbol(), "LDEGEN");
        assertEq(lockToken.lockDuration(), 90 days);
        assertEq(lockToken.minDepositAmount(), 1e22);
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
