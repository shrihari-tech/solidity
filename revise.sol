// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;
contract demo{
    constructor(string memory _name){
        name = _name;
    }
    string public name="Hari";
    int neg=-10;
    uint pos=10;
    bool bol=true;
    int age;
    uint marks;
    uint [] public  ar=[1,2,3,4];
    mapping(int => Book)b;
    modifier check(int _age){
        if(_age>0){
            revert("Age is greater 0");
        }
        //require(_age>=0,"Age is not accepted");
        _;//to push in to next process

    }
    struct Book{
        int id;
        string name;
        string author;
    }Book public book;

    function bookreq(int _id,string memory _name,string memory _author)public {
        book.id=_id;
        book.name=_name;
        book.author=_author;
        b[_id]=book;
    }

    function bookRegister(int _id,string memory _name,string memory _author)public {
        book=Book(_id,_name,_author);
    }

    function bookret() public view returns(Book memory){
        return book;
    }
    function bookretu(int _id) public view returns(Book memory){
        return b[_id];
    }


    int public len=0;
    uint public len2;
    function loop() public{
        while(len<=5){
            len+=1;
        }
        for(int i=0;i<10;i++){
            len+=1;
        }
        len2=ar.length;
        ar.push(8);
        ar.pop();
    }
    address ad = 0x5C503Ff073B2B96D701e7f9c616B6B5C791e5bF0;
    function fun(int _age,uint _marks) public check(_age) {
        //require(_age>=0,"Age is not accepted");
        age=_age;
        marks=_marks;
    }
        function change(int _age,uint _marks) public check(_age) {
        //require(_age>=0,"Age is not accepted");
        age=_age;
        marks=_marks;
    }

    function funview()public view returns(int,uint) {
            return(age,marks);
    }

}