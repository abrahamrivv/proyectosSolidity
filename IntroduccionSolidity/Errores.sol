// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


contract Errores {

    address private owner;
    
    constructor() {
        owner = msg.sender;
    }

     modifier EsOwner() {
        require(owner == msg.sender, "No eres el creador del contrato");
        _;
    }

    function Suma(uint numero1, uint numero2) public view EsOwner() returns(uint) {
        uint resultadoSumaInterna;
        resultadoSumaInterna = numero1 + numero2;
        return resultadoSumaInterna;
    }

}