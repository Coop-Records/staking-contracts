// SPDX-License-Identifier: LGPL-3.0-only
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../contracts/CoopLockToken.sol";

contract CoopLockTokenTest is Test {
    CoopLockToken public lockToken;
    address public user = address(0x1);
    address public constant DEGEN_TOKEN = 0x4ed4E862860beD51a9570b96d89aF5E1B0Efefed;
    address public constant TEST_TOKEN = address(0x2);

    string public constant DEFAULT_NAME = "Locked Coop";
    string public constant IJN_NAME = "Locked IJN";
    string public constant DEFAULT_SYMBOL = "LCOOP";
    string public constant IJN_SYMBOL = "LIJN";

    function setUp() public {
        lockToken = new CoopLockToken(DEGEN_TOKEN, DEFAULT_NAME, DEFAULT_SYMBOL);
    }

    function test_InitialState() public {
        assertEq(lockToken.name(), DEFAULT_NAME);
        assertEq(lockToken.symbol(), DEFAULT_SYMBOL);
        assertEq(lockToken.lockDuration(), 90 days);
        assertEq(lockToken.minDepositAmount(), 1e22);
        assertEq(address(lockToken.TOKEN()), DEGEN_TOKEN);
    }

    function test_CustomTokenName() public {
        CoopLockToken customLockToken = new CoopLockToken(TEST_TOKEN, IJN_NAME, DEFAULT_SYMBOL);
        assertEq(customLockToken.name(), IJN_NAME);
    }

    function test_CustomTokenSymbol() public {
        CoopLockToken customLockToken = new CoopLockToken(TEST_TOKEN, IJN_NAME, IJN_SYMBOL);
        assertEq(customLockToken.symbol(), IJN_SYMBOL);
    }

    function test_CustomTokenAddress() public {
        CoopLockToken customLockToken = new CoopLockToken(TEST_TOKEN, DEFAULT_NAME, DEFAULT_SYMBOL);
        assertEq(address(customLockToken.TOKEN()), TEST_TOKEN);
    }

    function test_RevertZeroAddress() public {
        vm.expectRevert(CoopLockToken.InvalidTokenAddress.selector);
        new CoopLockToken(address(0), DEFAULT_NAME, DEFAULT_SYMBOL);
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
