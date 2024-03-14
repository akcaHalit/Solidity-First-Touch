// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Bank{
    
    mapping(address => uint) balances;

    // The function has to payable to send ethers, if not error is occured.
    // If we want to ether to a function it has to be " payable ".
    function sendEthersToContract() payable external {
        balances[msg.sender] = msg.value;
    }

    function showBalance() external view returns(uint){
        return balances[msg.sender];
    } 

    // If we want to send ethers to a address. The Address is also has to be " payable ".
    function withdraw(address payable to,uint amount) external {
        require(balances[msg.sender] >= amount, "insufficient funds");      // control if we have the amount or not
        //payable(msg.sender).transfer(balances[msg.sender]);  //Parameter is already payable. it is not necessary anymore.
        to.transfer(amount);
        balances[msg.sender] -= amount;        // update the balance
    }

}