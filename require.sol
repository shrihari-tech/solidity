// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;
contract Require{
    mapping(address=>uint)public balanceOf;
    function fund()public payable {
        balanceOf[msg.sender]+=msg.value;
    }
    function withdraw(uint _amount)public{
        require(_amount<balanceOf[msg.sender],"Amount is High");
        balanceOf[msg.sender]=balanceOf[msg.sender]-_amount;
        payable(msg.sender).transfer(_amount);
    }
}