// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Asset {

    string public state = "onSale";

    error stateNotDefined(uint notValidNumber);

    function changeState(uint newState) public {
        // requiere es otra manera de detectar errores, ya que es una validación que si no se cumple lanza un mensaje personalizado
        // require(newState == 0 || newState == 1, "This state is not defined");
        if(newState == 0) {
            state = 'onSale';
        }else if(newState == 1) {
            state = 'notForSale';
        }else{
            revert stateNotDefined(newState);
        }
    }
}