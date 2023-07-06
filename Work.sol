// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract Profile{
    //data type 
    string name="hari";
    int age=20;
    uint private data=34;
    uint public number=12; //internal can be used only in side contract , private can be used only within the decaled contract
    bool internal pass=true;
    address Address=0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    
    //constructor
    constructor(uint _number){
        number=_number;
    }
}


//Instance use by creating objects
contract Profile1{
    Profile profile = new Profile(21);
    function p1() public view returns(uint){
        return profile.number();
    }
}


//Inheritance use by Extending the Contract
contract Profile2 is Profile(34) {
    
    function p2() public returns (bool){
        pass=false;
        return pass;

    }
}