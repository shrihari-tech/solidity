// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;
contract Loop{
    function fo(uint a)public pure returns(uint){
        while(a==10){
            return a;
        }
    } 
}