// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/access/AccessControl.sol";


contract RolesDeAcceso is AccessControl {

    bytes32 roleAdmin = keccak256("ROL_ADMIN");
    bytes32 roleWriter = keccak256("ROL_WRITER");

    constructor() {
        _grantRole("ROL_ADMIN", msg.sender);
    }

    modifier onlyAdmin() {
        require(hasRole("ROL_ADMIN", msg.sender), "Solo el admin puede usar esta funcion");
        _;
    }

    modifier onlyWriter() {
        require(hasRole("ROL_WRITER", msg.sender), "Solo el writer puede usar esta funcion");
        _;
    }

    function setWriter(address cuentaWriter) public onlyAdmin{
        _grantRole("ROL_WRITER", cuentaWriter);
    }

    function removeWriter(address cuentaWriter) public onlyAdmin{
        _revokeRole("ROL_WRITER", cuentaWriter);
    }
    
    // Aquí comienza el contrato storage

    uint256 number;

    /**
     * @dev Store value in variable
     * @param num value to store
     */
    function store(uint256 num) public onlyWriter{
        number = num;
    }

    /**
     * @dev Return value 
     * @return value of 'number'
     */
    function retrieve() public view returns (uint256){
        return number;
    }
    
}