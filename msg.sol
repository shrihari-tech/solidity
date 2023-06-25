// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;
contract MSG{
    address payable public owner;//payable only onwe can send trans
    uint public bal;

    constructor(){
        owner = payable(msg.sender);
    }
    function rev() external payable{
        bal=bal+msg.value / 1000000000000000000;
    }
    function send(uint _amt)external payable{
        uint valueInWei=1000000000000000000;
        require(bal>0,"Balance not sufficient");
        uint amt = _amt*valueInWei;
        //bal=bal-amt;
        payable(msg.sender).transfer(amt);
    }
}