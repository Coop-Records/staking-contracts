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
- **Address**: `0x64c4dba436d6f8993371f5fd915314bc268debb5`
- **Transaction**: `0x57fe41fcdf1f3be18729f9ac8b14b9c2ee9afdfb0d6c0cc5290e4b934efa5979`
- **Block**: 23885200 (0x16ca190)
- **Deployer**: `0x9f8416544f8d16b3999033bd499d655d64a0066c`
- **Network**: Base Mainnet (Chain ID: 8453)
- **Explorer**: [View on BaseScan](https://basescan.org/address/0x64c4dba436d6f8993371f5fd915314bc268debb5)
- **Gas Used**: 841,494 (0xcd916)
- **Effective Gas Price**: 0.005925242 gwei (0x5a767a)
- **Constructor Args**:
  - Token: `0x2Da1F02de055Cebe51c6f6526ed67Ad0dc86f431`
  - Name: "Locked IJN"
  - Symbol: "LIJN"

### Base Sepolia Testnet

Latest Deployment:

- **Contract**: CoopLockToken
- **Address**: `0x18a898B130Da8DAfC784DEAC1a46381b636e3C76`
- **Transaction**: `0xd2f3dc24ec2903717cd0e6ea24ee51933f2f745a314542e80fbfb06d62219aa4`
- **Block**: 19473094
- **Deployer**: `0x9F8416544f8d16b3999033bd499d655d64a0066C`
- **Network**: Base Sepolia (Chain ID: 84532)
- **Explorer**: [View on BaseScan](https://sepolia.basescan.org/address/0x18a898B130Da8DAfC784DEAC1a46381b636e3C76)
- **Gas Used**: 835,045
- **Gas Price**: 0.000100347 gwei
- **Constructor Args**:
  - Token: `0x2Da1F02de055Cebe51c6f6526ed67Ad0dc86f431`
  - Name: "Locked IJN"
  - Symbol: "LIJN"
