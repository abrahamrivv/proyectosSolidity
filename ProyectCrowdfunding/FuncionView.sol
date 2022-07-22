// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Asset {
    string name = "PlatziCoin";

    function getName() public view returns (string memory) {
        return name;
    }
}

//view : La usamos para definir que una función no va modificar las variables de estado, sino que sólo las puede leer.