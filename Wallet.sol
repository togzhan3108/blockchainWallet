// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.7;

contract Wallet{
    int balance;

    constructor() {
        balance = 0;
    }

    function getBalance() view public returns(int){
        return balance;
    }

    function depositBalance(int amount) public{
        balance = balance + amount;
    }

    function withdrawBalance(int amount) public{
        balance = balance - amount;
    }
}
