// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Modificadores {

    address private owner;
    string private nombreOwner;

    constructor(string memory nombre) {
        owner = msg.sender;
        nombreOwner = nombre;
    }

    modifier EsOwner() {
        if(msg.sender != owner) revert();
        _;
    }

    function Suma(uint numero1, uint numero2) public view EsOwner() returns(uint) {
        uint resultadoSumaInterna;
        resultadoSumaInterna = numero1 + numero2;
        return resultadoSumaInterna;
    }

}