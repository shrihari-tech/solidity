// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Library {
    struct Book {
        uint id;
        string name;
        bool isTaken;
        uint takenBy;
    }
    
    mapping(uint => Book) public books;
    
    function addBook(uint _id, string memory _name) public {
        require(books[_id].id != _id, "Book with this ID already exists");
        
        books[_id] = Book(_id, _name, false, 0);
    }
    
    function takeBook(uint _id, uint _user_id) public {
        Book storage book = books[_id];
        
        require(book.id == _id, "Book with this ID does not exist");
        require(!book.isTaken, "Book is already taken");
        
        book.isTaken = true;
        book.takenBy = _user_id;
    }
}
