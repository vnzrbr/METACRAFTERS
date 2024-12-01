# ETHAVAX3 MYTOKEN SMART CONTRACT

## Description

This Solidity smart contract implements an ERC20 token with additional functionalities for minting, burning, and transferring tokens. The contract is built using the OpenZeppelin library, ensuring robust and secure implementations of standard token operations. This example demonstrates the integration of OpenZeppelin libraries to create a custom token.

## Getting Started

### Executing Program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/(https://remix.ethereum.org/).

 Create a new file by clicking the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., ETHAVAX3.sol).
 Copy and paste the following code into the file:

```solidity
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
```
## Compilation and Deployment

    In Remix, click on the "Solidity Compiler" tab in the left-hand sidebar.
    Set the "Compiler" version to 0.8.0 or any compatible version.
    Click "Compile MyToken.sol."

To deploy:

    Go to the "Deploy & Run Transactions" tab in the sidebar.
    Ensure the environment is set to "Injected Web3" or another appropriate Ethereum provider.
    Deploy the ETHAVAX3 contract by providing an address, token name, and symbol as constructor arguments.

## Interacting with the Contract

    Minting Tokens: The mintT function allows the contract owner to mint tokens to a specific address.
    Burning Tokens: Use the burnT function to burn tokens from the caller's balance.
    Transferring Tokens: Call the transferT function to transfer tokens to another address.

## Authors

Salvatierra, Venz Rebber A.

## License

This project is licensed under the MIT License - see the LICENSE.md file for details.