// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Class {
    
    struct Student {
        string name;
        uint document;
    }
    
    Student[] public students;

    constructor(string memory _name, uint _document ){
        students.push(Student({name: _name, document: _document}));
    }
}