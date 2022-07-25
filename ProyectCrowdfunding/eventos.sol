// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Asset {

    string public tokenName = "DGT Coin";

    event changeNameEvent (
        address editor,
        string newName
    );

    function changeName(string memory newName) public {
        tokenName = newName;
        emit changeNameEvent(msg.sender, newName);
    }
}