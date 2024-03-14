// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Bank{
    
    mapping(address => uint) balances;

    // The function has to payable to send ethers, if not error is occured.
    function sendEthersToContract() payable external {
        balances[msg.sender] = msg.value;
    }

    function showBalance() external view returns(uint){
        return balances[msg.sender];
    } 
    
}