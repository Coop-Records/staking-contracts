# CoopLockToken Smart Contract

This repository contains the CoopLockToken smart contract, which enables token locking functionality with configurable parameters.

## Key Features

- **Token Locking**: Lock any ERC20 token for a specified duration
- **Configurable Parameters**:
  - Dynamic lock duration (90 days by default)
  - Adjustable minimum deposit amount
  - Customizable token name and symbol
- **Non-transferrable**: Locked tokens cannot be transferred between accounts
- **Owner Controls**:
  - Ability to reduce lock duration
  - Ability to update minimum deposit amount
- **Security Features**:
  - Reentrancy protection
  - Ownership controls
  - SafeERC20 implementation

## Test

```shell
# Run tests
pnpm test

# Run tests with gas reporting
pnpm test:gas
```

## Deploy

Deploy the contract using Foundry:

```shell
# Deploy to Base Sepolia
pnpm deploy:base-sepolia

# Deploy to Base Mainnet
pnpm deploy:base
```

Required environment variables:

- `PRIVATE_KEY`: Your deployer wallet's private key
- `ETHERSCAN_API_KEY`: Your Etherscan API key for contract verification

## Deployments

### Base Mainnet

Latest Deployment:

- **Contract**: CoopLockToken (IJN Lock)
- **Address**: `0x0b641675855E3BB3Fc14B5Bc5A8CcA5910c2329c`
- **Transaction**: `0xaaef792bca9c50540a749fef4459aa04706b825d5b776f44f7d58fe50b34b584`
- **Block**: 24281449
- **Deployer**: `0x3c10FAED26a6bb341322d1BAaf2c6ecf5B957D61`
- **Network**: Base Mainnet (Chain ID: 8453)
- **Explorer**: [View on BaseScan](https://basescan.org/address/0xaaef792bca9c50540a749fef4459aa04706b825d5b776f44f7d58fe50b34b584)
- **Gas Used**: 823,674 (0xc957a)
- **Effective Gas Price**: 0.00137147 gwei (0x217bdb)
- **Constructor Args**:
  - Token: `0x0b641675855E3BB3Fc14B5Bc5A8CcA5910c2329c`
  - Name: "Locked IJN"
  - Symbol: "LIJN"

### Base Sepolia Testnet

Latest Deployment:

- **Contract**: CoopLockToken
- **Address**: `0x844896b77b2f739ef3e4318b6d1cc7c1195d165e`
- **Transaction**: `0x2a143d52e466324980aacd5c6a9b0320bf10d3b56c078e28e959ca81c3a52924`
- **Block**: 19398624 (0x12923e0)
- **Deployer**: `0x9f8416544f8d16b3999033bd499d655d64a0066c`
- **Network**: Base Sepolia (Chain ID: 84532)
- **Explorer**: [View on BaseScan](https://sepolia.basescan.org/address/0x844896b77b2f739ef3e4318b6d1cc7c1195d165e)
- **Gas Used**: 823,674 (0xc957a)
- **Effective Gas Price**: 0.0000999 gwei (0x187fa)
- **Constructor Args**:
  - Token: `0x2Da1F02de055Cebe51c6f6526ed67Ad0dc86f431`
  - Name: "Locked IJN"
  - Symbol: "LIJN"
