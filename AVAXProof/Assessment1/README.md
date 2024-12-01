# ETHAVAX1 STRING LENGTH EVEN/ODD CHECKER

## Description

This Solidity program checks whether the length of a given string is even or odd. It incorporates error handling mechanisms using require, revert, and assert to demonstrate their functionalities. The program ensures input validation, enforces conditions, and provides meaningful responses to the user.

## Getting Started
### Executing Program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

    Create a new file by clicking the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., StringLengthEvenOdd.sol).
    Copy and paste the following code into the file:

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract stringLengthEvenOdd {
    function stringEvenOdd(string memory mess) public pure returns (string memory) {
        uint messLength = getLength(mess); 
        require(messLength >= 2, "String must have 2 or more characters");
        
        if (messLength < 20) {
            revert("Message too short");
        }
        
        assert(messLength != 21);

        if (messLength % 2 == 0) {
            return string.concat("Message: ", mess, "'s length is even.");
        } else {
            return string.concat("Message: ", mess, "'s length is odd.");
        }
    }

    function getLength(string memory s) public pure returns (uint256) { 
        bytes memory b = bytes(s); 
        return b.length; 
    } 
}
```

## Compilation and Deployment

    In Remix, click on the "Solidity Compiler" tab on the left-hand sidebar.
    Set the "Compiler" version to 0.8.18 or any compatible version.
    Click "Compile StringLengthEvenOdd.sol."

    To deploy:

    Go to the "Deploy & Run Transactions" tab in the sidebar.
    Select the compiled contract from the dropdown menu.
    Click the "Deploy" button.

## Interacting with the Contract

    Use the stringEvenOdd function to check the evenness or oddness of a string's length. Input your desired string as the parameter.
    The contract will return a message indicating whether the string's length is even or odd.
    For lengths below 2 or 20, specific errors will be triggered, demonstrating the contract's error handling.

## Authors

Salvatierra, Venz Rebber A.

## License

This project is licensed under the MIT License - see the LICENSE.md file for details.