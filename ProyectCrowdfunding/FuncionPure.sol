// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Sum {
    int256 number = 100;

    function sum(int256 a, int256 b) public pure returns (int256 result) {
        result = a + b;
    }
}

// pure: Se usa para definir que  
//una función no lee ni modifica ninguna de las variables de estado y además no usa ninguna variable global