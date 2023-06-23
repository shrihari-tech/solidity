// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;
contract owner{
    constructor(int _id){
        id=_id;
        
    }
    modifier check(int _id){
        require(_id==id,"Id Accepted");
        _;
    }
    int id=1;
    function ow(int _id) public check(_id){
        id=_id;
    }
    function funview(int _id)public check(_id) view  returns(int){
        return(id);
    }

}