// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;
contract Mapping {
    mapping(uint => string)person; //maps the uint with the string
    function addPerson(uint _number,string memory _name)public{
        person[_number]=_name;
    }
}