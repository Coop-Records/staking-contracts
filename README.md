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
forge script script/DeployDegenLock.s.sol --rpc-url https://sepolia.base.org --broadcast --verify -vvvv

# Deploy to Base Mainnet (replace with your RPC URL)
forge script script/DeployDegenLock.s.sol --rpc-url $RPC_URL --broadcast --verify -vvvv
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

### Base Sepolia Testnet

Latest Deployment:

- **Contract**: DegenLockToken
- **Address**: `0xe6c6a8fa73dff0c4ca3ce8d546ebb2795f8051a9`
- **Transaction**: `0x4d664e33477861c7d1bddbb0bffdcee0040cd2ddb8fad028ebe3d357032685e3`
- **Block**: 19406063 (0x1281cef)
- **Deployer**: `0x35ce1fb8caa3758190ac65edbcbc9647b8800e8f`
- **Network**: Base Sepolia (Chain ID: 84532)
- **Explorer**: [View on BaseScan](https://sepolia.basescan.org/address/0xe6c6a8fa73dff0c4ca3ce8d546ebb2795f8051a9)
- **Gas Used**: 828375 (0xca3d7)
- **Effective Gas Price**: 0.000050679 gwei (0xc5f7)

Previous Deployment:

- **Contract**: DegenLockToken
- **Address**: `0x87b9beb8b62748785dc2352e622d8ed67d37be7d`
- **Transaction**: `0x89ec46639b38233ba1008cfaa1fc992ce0d659a7a3c0c6496d138060336102ec`
- **Block**: 19405164
- **Deployer**: `0x35ce1fb8caa3758190ac65edbcbc9647b8800e8f`
- **Network**: Base Sepolia (Chain ID: 84532)
- **Explorer**: [View on BaseScan](https://sepolia.basescan.org/address/0x87b9beb8b62748785dc2352e622d8ed67d37be7d)
