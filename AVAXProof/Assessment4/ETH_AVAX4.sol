// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

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
