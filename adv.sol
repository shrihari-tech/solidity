// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;
contract ADV{
    uint public gaslimit = block.gaslimit;
    address public currentIntractor = msg.sender;
    uint public ethvalue = msg.value;
    uint public blockNo = block.number;
    
}