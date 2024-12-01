// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/access/Ownable.sol";

contract MyToken is ERC20, Ownable {

    constructor(address, string memory name, string memory symbol) ERC20(name, symbol) {
        uint256 initialSupply = 1000000;
        _mint(msg.sender, initialSupply);
    }

    function mintT(address to, uint256 amount) external onlyOwner {
        _mint(to, amount); 
    }

    function burnT(uint256 amount) external {
        _burn(msg.sender, amount); 
    }

    function transferT(address destination, uint256 amount) public {
        _transfer(msg.sender, destination, amount); 
    }
}
