// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/console.sol";


interface IERC20 {
    // string public name;
    // string public symbol;
    // uint8 public decimals;
    // uint256 public totalSupply;

    function balances(address) external returns(uint256);
    function allowance(address, address) external returns(uint256);

    event Transfer(address indexed _from, address indexed _to, uint256 _value);

    function transfer(uint256 amount, address to) external returns(bool);

    function transferFrom(address from, address to, uint256 amount) external returns(bool);

    function approve(address to, uint256 amount) external returns(bool);
}


contract Casino {

    IERC20 public token;

    address public newRealisation;

    event Deposit(address indexed user, uint256 depositAmount, uint256 userBalance);

    mapping(address => uint256) public balances;

    constructor(address _token) {
        token = IERC20(_token);
    }

    function deposit(uint256 amount) external {
        require(token.balances(msg.sender) >= amount, "");
        require(token.allowance(msg.sender, address(this)) >= amount);
        token.transferFrom(msg.sender, address(this), amount);
        balances[msg.sender] += amount;
        // emit Deposit(msg.sender, msg.value, balances[msg.sender]);
    }

    // receive() external payable {
    //     // console.log("Receive function");
    //     balances[msg.sender] += msg.value;
    // }

    // fallback() external { // payable
    //     msg.data;
    //     console.log("Fallback function");
    // }

}
