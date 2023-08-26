// SPDX-License-Identifier: MIT
pragma solidity =0.5.16;

import '../NobleERC20.sol';

contract ERC20 is NobleERC20 {
    constructor(uint _totalSupply) public {
        _mint(msg.sender, _totalSupply);
    }
}
