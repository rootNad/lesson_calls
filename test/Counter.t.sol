// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Casino.sol";

import "forge-std/console.sol";
import "src/ERC20.sol";


contract CounterTest is Test {
    // Counter public counter;
    Casino public casino;
    ERC20 public token;

    function setUp() public {
        // counter = new Counter();
        token = new ERC20();
        casino = new Casino(address(token));
    }

    function testIncrement() public {
        // counter.increment();
        // assertEq(counter.number(), 1);
        // casino.deposit{value: 10000}(); // receive
        payable(casino).transfer(1000);
        // casino.aaa(); //fallback
    }

    // function testSetNumber(uint256 x) public {
    //     counter.setNumber(x);
    //     assertEq(counter.number(), x);
    // }
}
