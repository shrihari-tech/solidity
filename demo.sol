// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18; //header file with solidity version ^ indicate only the specified verison
//sol staticaly typed language
contract demo{ //main function
    string name ="hari";
    int age = 20;//takes 256 bits
    int8 ages=20; // takes only 8 bits
    uint num = 25; //unsigned integers - does not take negative values
    //bytes- stores long data 
    //address - stores hash values (16bit) address
    //fucntion delecration
    struct str{
        uint number;
        string names;
    }
    modifier mod(){
        require(age>=25,"Age is greater the 25");//alternative of if
        _;//makes modifer to run
    }
    function data()public view mod returns(string memory,uint) {//string memory used to str tem data of str
        /*if(age<25){
            revert("Age is below 25");//throw the error
        }*/
        return (name,num);

    }

    function changename(string memory _name,uint _num) public{
        name=_name;
        num=_num;
    }
}

