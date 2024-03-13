// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Constructor{

    /*
    string public tokenName;
    uint public totalSupply;
    
    constructor(string memory name, uint number){
        tokenName = name;
        totalSupply = number;
    }
    */
    uint public immutable totalSupply;
    address public immutable owner;

    // address is not using in constructor parameter. 
    constructor(uint number){
        owner = msg.sender;
        totalSupply = number;
    }

    uint public constant consNum = 100;
    //function cantSet(uint number) public view {
    //    consNum = number;
    //}


}