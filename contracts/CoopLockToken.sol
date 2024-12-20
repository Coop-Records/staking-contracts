// SPDX-License-Identifier: LGPL-3.0-only
pragma solidity ^0.8.0;

import {IERC20, SafeERC20} from "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {ReentrancyGuard} from "@openzeppelin/contracts/utils/ReentrancyGuard.sol";

/*
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWNXK0OkkkkkkO0KXWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWNOdl:'...        ...':lx0XWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMW0d:.                        .:d0NMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMWKd;.                              .;dKWMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMW0l.                                    .l0WMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMNKOkkxkO0KOl.                                        .lKWMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMW0l'.       ..                                            'xNMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMO'   .',,,.                                                .lXMMMMMMMMMMMMMMMMMM
MMMMMMMMMWo   ,0NWWK:                                                  cXMMMMMMMMMMMMMMMMM
MMMMMMMMMMk.  .xWMNo                      .',,,,'.                      oNMMMMMMMMMMMMMMMM
MMMMMMMMMMNo.  .oXx.                  .,oOKNWWWWNKOo,                   .kWMMMMMMMMMMMMMMM
MMMMMMMMMMMNx.   '.                  ,kNMMMMMMMMMMMMNk,                  :XMMMMMMMMMMMMMMM
MMMMMMMMMMMMW0:.                    cXMMMMMMMMMMMMMMMMK:                 .kMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMNk;                  ,0MMMMMMXkddkNMMMMMM0'                 dWMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMNk;                cNMMMMMNo   .oWMMMMMX:                 oWMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMNO:.             ;XMMMMMW0c;;l0WMMMMMK,                 oWMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMW0l'           .dWMMMMMMMWWMMMMMMMNo.                .kMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMNO0WMMXx:.         .oXMMMMMMMMMMMMMMXl.                 ,KMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMWd';xXWMWKd;.        'o0NMMMMMMMWNOo'                  .dWMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMX:  .lONMMW0o,.       .':looool:'.                    .OWMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMM0;    ,o0NMMN0d;.                                     'dNMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMM0;     .,o0NMMWKxc.                               ..   :0WMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMXl.      .,lONWMWXOo;.                         .lK0;   'OWMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMNk,         'cxKWMMWKkl:;.                   ,kWMMXl   ,0MMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMXd'          .,lkXWMMMWKko;..            .oXMMMMM0,  .dWMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMXx;.           .;ok0XWMMWX0xl;..       .,;cclcc,   .kMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMWKd;.            ..;lx0NWMMWX0koc;'..          .;kWMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWXko:,..           .'cxKWMMMMMWNK0OxdolllodkKWMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNX0kxolllccllooxk0NWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
*/
contract CoopLockToken is ERC20, Ownable, ReentrancyGuard {
    using SafeERC20 for IERC20;

    mapping(address account => uint256) public depositTimestamps;

    /**
     * @dev Symbol of the token representing the claim on the locked token
     */
    string public constant TOKEN_SYMBOL = "LDEGEN";

    /**
     * @dev The ERC20 token to be locked
     */
    IERC20 public immutable TOKEN;

    /**
     * @dev Lock duration in seconds, period starts after the deposit timestamp
     */
    uint256 public lockDuration = 90 days;

    /**
     * @dev Minimum amount of tokens that have to be deposited
     */
    uint256 public minDepositAmount = 1e22;

    /**
     * @dev Withdraw is not possible because the lock period is not over yet
     */
    error LockPeriodOngoing();

    /**
     * @dev ERC-20 function is not supported
     */
    error NotSupported();

    /**
     *  @dev The new lock duration is too long
     */
    error LockDurationIsTooLong();

    /**
     *  @dev Amount of tokens to be locked is zero
     */
    error ZeroAmount();

    /**
     * @dev Token address cannot be zero
     */
    error InvalidTokenAddress();

    /**
     * @dev Minimum deposit not met
     */
    error MinimumDepositNotMet();

    /**
     *  @dev The lock duration has been updated
     */
    event LockDurationUpdated(uint256 duration);

    /**
     *  @dev The minimum deposit amount has been updated
     */
    event MinDepositAmountUpdated(uint256 minDepositAmount);

    /**
     *  @dev Tokens have been deposited
     */
    event Deposit(
        address indexed account,
        uint256 depositTimestamp,
        uint256 amount
    );

    /**
     *  @dev Tokens have been withdrawn
     */
    event Withdraw(
        address indexed account,
        uint256 depositTimestamp,
        uint256 amount
    );

    /**
     * @dev Construct a new lock token
     * @param token_ The ERC20 token to be locked
     * @param name_ The name of the lock token
     * @param symbol_ The symbol of the lock token
     */
    constructor(
        address token_,
        string memory name_,
        string memory symbol_
    ) ERC20(name_, symbol_) Ownable(msg.sender) {
        if (token_ == address(0)) revert InvalidTokenAddress();
        TOKEN = IERC20(token_);
    }

    /**
     * @dev Deposit tokens to be locked until the end of the locking period
     *
     * Note: A new deposit resets the lock duration for all COOP tokens to start
     * from the latest deposit timestamp. Even if some tokens were previously
     * unlocked, a new deposit will lock all tokens for the full lockDuration.
     *
     * @param amount The amount of tokens to deposit
     */
    function deposit(uint256 amount) external nonReentrant {
        if (balanceOf(msg.sender) + amount < minDepositAmount) {
            revert MinimumDepositNotMet();
        }

        TOKEN.safeTransferFrom(msg.sender, address(this), amount);
        _mint(msg.sender, amount);

        depositTimestamps[msg.sender] = block.timestamp;
        emit Deposit(msg.sender, block.timestamp, amount);
    }

    /**
     * @dev Withdraw tokens after the end of the locking period or during the deposit period
     * @param amount The amount of tokens to withdraw
     */
    function withdraw(uint256 amount) external nonReentrant {
        if (amount == 0) {
            revert ZeroAmount();
        }

        if (block.timestamp <= depositTimestamps[msg.sender] + lockDuration) {
            revert LockPeriodOngoing();
        }

        _burn(msg.sender, amount);
        TOKEN.safeTransfer(msg.sender, amount);
        emit Withdraw(msg.sender, block.timestamp, amount);
    }

    /**
     * @dev Update the lock duration
     * @param newDuration The new lock duration in seconds
     */
    function reduceLockDuration(uint256 newDuration) external onlyOwner {
        if (newDuration > lockDuration) {
            revert LockDurationIsTooLong();
        }

        lockDuration = newDuration;
        emit LockDurationUpdated(lockDuration);
    }

    /**
     * @dev Update the minimum deposit amount
     *
     * Note: If minDepositAmount is increased, users with deposits greater than or
     * equal to the old minDepositAmount but less than the new minDepositAmount
     * will have a locked COOP token balance smaller than the new minDepositAmount.
     * This does not affect their ability to withdraw their locked COOP.
     *
     * @param newMinDepositAmount The new minimum deposit amount
     */
    function updateMinDepositAmount(
        uint256 newMinDepositAmount
    ) external onlyOwner {
        minDepositAmount = newMinDepositAmount;
        emit MinDepositAmountUpdated(minDepositAmount);
    }

    /**
     * @dev Lock claim tokens are non-transferrable: ERC-20 transfer is not supported
     */
    function transfer(address, uint256) public pure override returns (bool) {
        revert NotSupported();
    }

    /**
     * @dev Lock claim tokens are non-transferrable: ERC-20 allowance is not supported
     */
    function allowance(
        address,
        address
    ) public pure override returns (uint256) {
        revert NotSupported();
    }

    /**
     *
     * @dev Lock claim tokens are non-transferrable: ERC-20 approve is not supported
     */
    function approve(address, uint256) public pure override returns (bool) {
        revert NotSupported();
    }

    /**
     *  @dev Lock claim tokens are non-transferrable: ERC-20 transferFrom is not supported
     */
    function transferFrom(
        address,
        address,
        uint256
    ) public pure override returns (bool) {
        revert NotSupported();
    }
}
