# Noble Swap Contracts

<p align="left">
  <a href="https://nobleswap.app">
      <img src="https://user-images.githubusercontent.com/85043551/213883186-882ccc6c-7b0a-4ce8-b5e3-a8d7258aeee5.png" height="175">
  </a>
</p>


This repo contains all the contracts used in Noble Swap. It is divided in independent projects where each of them contains its smart contracts, test environment and unique config files.

## Existing projects

| Project name                                                          | Description                                                                                                                | Solidity version(s)      |
| --------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------- | ------------------------ |
| [Core Protocol](./contracts/core)                     | Based on Uniswap V2, contains the Factory Contract that creates the individual Pair Contracts for the Swap                                      | 0.5.16           |
| [Periphery](./contracts/periphery)                             | Based on Uniswap V2, contains the Router Contract that allows the other Apps and Users to interact with the Factory and Swap between the Pairs                                     | 0.6.6                   |
| [Staking Pools](./contracts/farms)                                 | Based on Uniswap V2, ncludes stand-alone pools and pool deployer                                                                                         | 0.8.17                   |                |
