// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;
contract Bank{
    mapping(address=>uint)public balance;
    address payable user;
    constructor(){
        balance[msg.sender]=0;
    }
    function receiveEther() external payable{
        balance[msg.sender]+=msg.value / 1000000000000000000;
    }
    
    function sendEther(address payable _user,uint _amt)external payable{
        uint valueInWei=1000000000000000000;
        require(balance[msg.sender]>=_amt,"Low Balance");
        balance[msg.sender]-=_amt;
        uint _amt=_amt*valueInWei;
        payable(msg.sender).transfer(_amt);

    }
}
