# ETH PROOF BEGINNERS COURSE _ TOKEN MINTING AND BURNING

## Description
This Solidity program is a simple example that demonstrates the basic syntax and functionality of the Solidity programming language. It includes a simulation of token minting and burning, providing a hands-on introduction for beginners to understand these fundamental blockchain operations and how they work within Ethereum smart contracts.


## Getting Started

### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., ETH_Beginner_Assessment.sol). Copy and paste the following code into the file:

```javascript

pragma solidity 0.8.18;


contract MyToken {
    string public tName = "Mochi";
    string public tAbbreviation = "MTA";
    uint public tSupply = 0; 
    mapping(address => uint) public balance;

    function tMint(address addr, uint num) public{
        tSupply += num;
        balance[addr] += num;
    }

    function tBurn(address addr, uint num) public{
        if (balance[addr] >= num){
            tSupply -= num;
            balance[addr] -= num;
        }
    }
}

```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.18" (or another compatible version), and then click on the "Compile ETH_Beginner_Assessment.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "MyToken-ETH_Beginner_Assessment" contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract is deployed, you can interact with it by clicking the drop down of the "tMint" function to input your desired address and number of tokens. Once you've filled in your desired parameters, click transact and these values will be reflected when calling the balance variable with the transacted address. 

The other function is the tBurn function which works similarly to the tMint function, with it subtracting from the balance of the adress instead.

## Authors

Salvatierra, Venz Rebber A.


## License

This project is licensed under the MIT License - see the LICENSE.md file for details