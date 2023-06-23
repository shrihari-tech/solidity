// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;
contract array{
    uint[] public ar=[5,2,8,9];
    uint public total;
    uint num;
    function sum() public{
        for(uint i=0;i<5;i++){
            total+=ar[i];
        }
    }
    /*function loop(uint _num) public{
        num=_num;
        ar.push(num);
    }*/

    function getLargest() public view returns(uint){
        uint greater = 0;
        uint i;
        for(i=0;i<5;i++){
           if(greater<ar[i]){
               greater = ar[i];
           }
       }
       return greater;
    }
    
}