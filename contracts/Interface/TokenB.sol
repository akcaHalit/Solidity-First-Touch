// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./IToken.sol";

// inherit the interface, same 
contract TokenB is IToken{
    uint256 constant private OWNER_BALANCE = 1000 * 10**18;

    mapping(address => uint256) balances;
    // Allower -> Allowee -> Amount
    mapping(address => mapping(address => uint256)) allowances;

    constructor() {
        balances[msg.sender] = OWNER_BALANCE;
    }

    function transfer(address to, uint256 amount) external override {
        require(to != address(0), "XFER_TO_ZERO");
        require(balances[msg.sender] >= amount, "INSUFFICENT_BAL");
    
        balances[msg.sender] -= amount;
        balances[to] += amount;
        // it's an event, so we emit it.
        emit Transfer(msg.sender, to, amount);
    }
    
    function transferFrom(address from, address to, uint256 amount) external override {
        require(to != address(0), "XFER_TO_ZERO");
        require(allowances[from][msg.sender] >= amount, "INSUFFICIENT_ALLOWANCE");
        require(balances[from] >= amount, "INSUFFICENT_BALANCE");

        allowances[from][msg.sender] -= amount;
        balances[from] -= amount;
        balances[to] += amount;
    }

    //  Bu Token'a ne kadar sahip olabilir?
    function increaseAllowance(address recipient, uint256 amount) external {
        require(recipient != address(0), "APPR_TO_ZERO");
        allowances[msg.sender][recipient] += amount;
    }

    function decreaseAllowance(address recipient, uint256 amount) external {
        require(recipient != address(0), "APPR_TO_ZERO");
        allowances[msg.sender][recipient] -= amount;
    }

    function balanceOf(address user) external view override returns(uint256) {
        return balances[user];
    }
}