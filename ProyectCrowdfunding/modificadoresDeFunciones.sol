// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract permission {

    address private owner;
    string public projectName = "DGT";

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == owner, "Only owner can change de project name");
        _; //la función es insertada donde aparezca este símbolo, en este caso después del require
    }

    function changeProjectName(string memory _projectName) public onlyOwner {
        projectName = _projectName;
    }
}