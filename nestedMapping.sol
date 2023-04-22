// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;
contract nestedMapping{
    mapping(uint=>mapping(uint=>string))person;
    function addPerson(uint _num1,uint _num2,string memory _name)public {
        person[_num1][_num2]=_name;
    }
    function getPerson(uint _num1,uint _num2)public view returns(string memory){
        return person[_num1][_num2];
    }
}