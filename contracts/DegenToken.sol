// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

/**
 * @notice The Degen token allows Farcaster community members to earn reputation tokens.
 * @custom:security-contact jacek@degen.tips
 */
contract DegenToken is ERC20, ERC20Burnable {
    string internal constant TOKEN_NAME = "Degen";
    string internal constant TOKEN_SYMBOL = "DEGEN";
    uint256 internal constant TOKEN_SUPPLY = 1_000_000_000;

    constructor() ERC20(TOKEN_NAME, TOKEN_SYMBOL) {
        _mint(msg.sender, TOKEN_SUPPLY * 10 ** decimals());
    }
}
