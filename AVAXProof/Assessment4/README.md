# ETHAVAX4 DEGEN TOKEN SMART CONTRACT

## Description

The degenToken Solidity smart contract implements an ERC20 token named "Degen" with symbol "DGN". In addition to standard token functionalities, this contract includes an inventory of beverages, allowing users to redeem items by burning tokens. The contract also supports minting, transferring, and checking balances. It is built using the OpenZeppelin library for secure and robust token standards.

## Getting Started

### Executing Program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/(https://remix.ethereum.org/).

Create a new file by clicking the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., DegenToken.sol).
Copy and paste the following code into the file:

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/access/Ownable.sol";

contract degenToken is ERC20, Ownable {

    struct Beverages {
        string name;
        string procuredFrom;
        uint256 price;
        uint256 stock;
    }

    mapping(uint => Beverages) private bev;

    constructor() ERC20("Degen", "DGN") {
        bev[1] = Beverages("Enmat Beer", "Tingen", 2, 67); 
        bev[2] = Beverages("Zarhar Beer", "Bayam", 3, 68); 
        bev[3] = Beverages("Southville Beer", "Backlund", 4, 131); 
        bev[4] = Beverages("Aurmir Red Wine", "Intis Republic", 126, 2);
        bev[5] = Beverages("Don't Forget the __", "Neva Neva Neva", 6, 69); 
    }

    function mint(address recipient, uint amount) public onlyOwner {
        _mint(recipient, amount);
    }

    function transfer(address recipient, uint amount) public override returns (bool) {
        require(amount > 0, "Amount must be greater than 0");
        _transfer(msg.sender, recipient, amount);
        return true;
    }

    function checkBalance() public view returns (uint) {
        return balanceOf(msg.sender);
    }

    function burnTokens(uint amount) public {
        require(amount > 0, "Amount must be greater than 0");
        _burn(msg.sender, amount);
    }

    function redeem(uint itemId, uint quantity) public {
        require(itemId > 0, "Invalid item ID");
        require(quantity > 0, "Quantity must be greater than 0");
        require(bev[itemId].stock >= quantity, "Not enough stock");
        require(balanceOf(msg.sender) >= bev[itemId].price * quantity, "Not enough DGN tokens");

        bev[itemId].stock -= quantity;
        _burn(msg.sender, bev[itemId].price * quantity);
    }

    function getItemDetails(uint itemId) public view returns (string memory name, string memory procuredFrom, uint price, uint stock) {
        require(itemId > 0, "Invalid item ID");
        Beverages memory item = bev[itemId];
        require(bytes(item.name).length > 0, "Item not found");
        return (item.name, item.procuredFrom, item.price, item.stock);
    }
}
```
## Compilation and Deployment

    In Remix, click on the "Solidity Compiler" tab in the left-hand sidebar.
    Set the "Compiler" version to 0.8.0 or any compatible version.
    Click "Compile DegenToken.sol."

To deploy:

    Go to the "Deploy & Run Transactions" tab in the sidebar.
    Deploy the contract and interact with its functions.

## Key Features

    Minting Tokens: The mint function allows the contract owner to create new DGN tokens.
    Burning Tokens: Use the burnTokens function to remove tokens from circulation.
    Beverage Redemption: The redeem function lets users exchange tokens for beverages in the inventory.
    Item Lookup: The getItemDetails function retrieves beverage details, including name, source, price, and stock.

## Authors

Salvatierra, Venz Rebber A.

## License

This project is licensed under the MIT License - see the LICENSE.md file for details.