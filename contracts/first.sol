// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FirstTouch{
    // State Variables
    string public sayHello = "Hello World!";
    
    //  Functions
    function show() public pure returns(string memory){
        // Local Variables
        string memory localString = "My Local String";
        return localString;
    }

    function showBlockNumber() public view returns(uint){
        // Global Variables
        return block.number;
    }
    
    uint x = 3;
    function add(uint y) public view returns(uint){
        return x+y;
    }

}