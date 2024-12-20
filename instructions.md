# instructions

## goal: refactor the Staking contract fileName, name, and symbol.

## notes

- use test driven development.

## steps:

1. refactory DegenLockToken.sol to CoopLockToken.sol
2. update any failing unit tests with the new file name.
3. Name - unit test - verify name is dynamically set in the constructor. change the contract name once again to reflect the branding of "COOP" or "IJN" in the unit test.
4. Name - CoopLockToken.sol - update the constructor to allow a name to be passed in.
5. Name - Script - deploy the contract with name "Locked IJN"
6. Symbol - unit test - verify symbol is dynamically set in the constructor. change the contract symbol once again to reflect the branding of "COOP" or "IJN" in the unit test.
7. Symbol - CoopLockToken.sol - update the constructor to allow a symbol to be passed in.
8. Symbol - Script - deploy the contract with symbol "LIJN"
9. remove any unused contract files.
10. Verify any reference to Degen has been refactored to Coop.
11. Update the README.md with the latest deployment details.
12. Update README.md with key features of CoopLockToken.sol.
