// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;
// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;
contract Assert{
    mapping(address=>uint)public balanceOf;
    function fund()public payable {
        balanceOf[msg.sender]+=msg.value;
    }
    modifier onlyLimit(uint _amount){
        assert(_amount<balanceOf[msg.sender]);
        _;
    }
    function withdraw(uint _amount)public onlyLimit(_amount){
        //require(_amount<balanceOf[msg.sender],"Amount is High");
        balanceOf[msg.sender]=balanceOf[msg.sender]- _amount;
        payable(msg.sender).transfer(_amount);
    }
}