// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract stringLengthEvenOdd{
    function stringEvenOdd(string memory mess) public pure returns (string memory){
        uint messLength = getLength(mess); 
        require( messLength >= 2 , "String must have 2 or more than characters");
        
        if (messLength < 20) {
            revert("Message too short");
        }
        
        assert(messLength != 21);

        if (messLength % 2 == 0) {
            return string.concat("Message: ", mess, "'s length is even.");
        }    
        else{
            return string.concat("Message: ", mess, "'s length is odd.");
        }
    }
    function getLength(string memory s) public pure returns (uint256) { 
        bytes memory b = bytes(s); 
        return b.length; 
    } 
}