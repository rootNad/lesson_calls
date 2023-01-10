// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;


contract ERC20 {
    
    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public totalSupply;

    mapping(address => uint256) public balances;
    mapping(address => mapping(address => uint256)) public allowance;

    event Transfer(address indexed _from, address indexed _to, uint256 _value);


    constructor() {
        name = "NewToken";
        symbol = "NT";
        decimals = 8;
        totalSupply = 1 ether;
        balances[msg.sender] = 1 ether;
    }

    function transfer(uint256 amount, address to) public returns(bool) {
        balances[msg.sender] -= amount;
        balances[to] += amount;
        emit Transfer(msg.sender, to, amount);
        return true;
    }

    function transferFrom(address from, address to, uint256 amount) public returns(bool) {
        require(allowance[from][msg.sender] >= amount, "Not enough allowance");
        balances[from] -= amount;
        balances[to] += amount;
        allowance[from][msg.sender] -= amount;

        return true;
    }

    function approve(address to, uint256 amount) public returns(bool) {
        // require(balances[]);
        allowance[msg.sender][to] += amount;
        return true;
    }
}