// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Fund {

function sendEther(address payable receiver) public payable {
        receiver.transfer(msg.value);
    }
}

//payable: La usamos cuando necesitamos dentro de una función enviar ether alguna dirección de la blockchain