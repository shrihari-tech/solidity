// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;
contract demo{
    string name="hari";
    int age=20;
    string class="IT";
    int year=3;

    function data() public view returns(string memory,int,string memory,int){
        if(age<25){
            revert("Age is less than 25");
        }
        return (name,age,class,year);
    }
    function changeData(string memory _name,int _age,string memory _class,int _year) public{
        name=_name;
        age==_age;
        class=_class;
        year=_year;
    }
}