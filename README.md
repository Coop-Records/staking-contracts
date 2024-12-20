# $DEGEN Smart Contracts

This repository holds the code for $DEGEN smart contracts, including the token and Airdrop 1 contracts.

## Test

```shell
npm run test
npm run test:report-gas
```

Running tests in VS Code: https://hardhat.org/hardhat-runner/docs/advanced/vscode-tests

## Deploy

### Using Foundry

Deploy the contract:

```shell
# Deploy to Base Sepolia
forge script script/DeployCoopLock.s.sol --rpc-url https://sepolia.base.org --broadcast --verify -vvvv

# Deploy to Base Mainnet (replace with your RPC URL)
forge script script/DeployCoopLock.s.sol --rpc-url https://mainnet.base.org --broadcast --verify -vvvv
```

Required environment variables:

- `PRIVATE_KEY`: Your deployer wallet's private key
- `ETHERSCAN_API_KEY`: Your Etherscan API key for contract verification

### Using Hardhat

Deploy to a local Hardhat node.

```shell
npm run compile
npm run node
npm run deploy:local
```

## Deployments

### Base Mainnet

Latest Deployment:

- **Contract**: DegenLockToken (IJN Lock)
- **Address**: `0x64c4dba436d6f8993371f5fd915314bc268debb5`
- **Transaction**: `0x57fe41fcdf1f3be18729f9ac8b14b9c2ee9afdfb0d6c0cc5290e4b934efa5979`
- **Block**: 23885200 (0x16ca190)
- **Deployer**: `0x9f8416544f8d16b3999033bd499d655d64a0066c`
- **Network**: Base Mainnet (Chain ID: 8453)
- **Explorer**: [View on BaseScan](https://basescan.org/address/0x64c4dba436d6f8993371f5fd915314bc268debb5)
- **Gas Used**: 841,494 (0xcd916)
- **Effective Gas Price**: 0.005925242 gwei (0x5a767a)
- **Constructor Args**: [`0x2Da1F02de055Cebe51c6f6526ed67Ad0dc86f431`]

### Base Sepolia Testnet

Latest Deployment:

- **Contract**: DegenLockToken
- **Address**: `0xdb047d326c84b07b4fe9afef8d058dbcc3ea1296`
- **Transaction**: `0xcbb369f0e03c4bbe12e13ee542a7c9b586cc3b8f1c3ed3a91091d3d6d7a0b445`
- **Block**: 19406560 (0x1281ee0)
- **Deployer**: `0x35ce1fb8caa3758190ac65edbcbc9647b8800e8f`
- **Network**: Base Sepolia (Chain ID: 84532)
- **Explorer**: [View on BaseScan](https://sepolia.basescan.org/address/0xdb047d326c84b07b4fe9afef8d058dbcc3ea1296)
- **Gas Used**: 841,494 (0xcd916)
- **Effective Gas Price**: 0.000100327 gwei (0x187e7)
- **Constructor Args**: [`0x4ed4E862860beD51a9570b96d89aF5E1B0Efefed`]

Previous Deployments:

1. `0xe6c6a8fa73dff0c4ca3ce8d546ebb2795f8051a9` (Block: 19406063)
2. `0x87b9beb8b62748785dc2352e622d8ed67d37be7d` (Block: 19405164)
