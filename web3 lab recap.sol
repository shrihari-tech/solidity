// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

contract Demo{
    string public  greets = "Hello World";
    int public  number   = 10;

    function greetings() public  view returns (string memory){
        return greets;
    }
    
    function change(int _number)public  returns (int){
        number = _number;
        return number;
    }

    struct Person{
        uint id;
        string name;
        int age;
    }

    mapping (uint => Person) public people;

    function addPerson(uint _id,string memory _name, int _age) public {
        people[_id] = Person(_id,_name,_age);
    }

    function getPerson(uint _id) public  view returns(uint,string memory,int){
        Person memory person = people[_id];
        return (person.id,person.name,person.age);
    }

    enum Light {Yellow,Red,Green}
    Light public currentLight;

    // constructor(){
    //     currentLight = Light.Red;
    // }
    event Message(Light light);

    function setLight(Light _light) public {
        currentLight = _light;
        emit Message(currentLight);
    }
    

    function getCurrentLight() public  view returns(string memory){
        // if(currentLight==Light.Red){
        //     return "Red";
        // }
        // else if(currentLight == Light.Yellow){
        //     return "Yellow";
        // }
        // else{
        //     return "Green";
        // }

    }

    address payable public owner;
    uint public  balance;

    constructor(){
        owner =payable(msg.sender);

    }

    function rev() external payable {
        balance = balance+msg.value / 1000000000000000000;
    }

    function send(uint _amt)external payable {
        uint valueInwei = 1000000000000000000;
        require(balance>0,"Balance Not Sufficient");
        uint amt = _amt*valueInwei;
        payable(msg.sender).transfer(amt);
    }


    
}