// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";

contract Token is ERC20, AccessControl {
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");
    uint256 public maxSupply;  // Maximum supply of tokens
    
    constructor(
        uint256 _maxSupply, 
        string memory _name, 
        string memory _symbol
    ) ERC20(_name, _symbol) 
    {
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender); // Asigna el rol de administrador al creador
        _grantRole(MINTER_ROLE, msg.sender); // Asigna el rol de emisor al creador
        maxSupply = _maxSupply;                      // Set the maximum supply
        _mint(msg.sender, 1000000 * (10 ** uint256(decimals()))); // Emisión inicial 100.000
    }

    function mint(uint256 amount) public {
        require(hasRole(MINTER_ROLE, msg.sender), "El usuario no esta autorizado para mintear tokens.");
        require(totalSupply() + amount <= maxSupply, "No se puede sobrepasar el suministro maximo.");
        _mint(msg.sender, amount);
    }

    function grantMinterRole(address minter) public {
        require(hasRole(DEFAULT_ADMIN_ROLE, msg.sender), "El usuario no es el administrador. Se requieren permisos para realizar esta accion.");
        grantRole(MINTER_ROLE, minter);
    }

    function revokeMinterRole(address minter) public {
        require(hasRole(DEFAULT_ADMIN_ROLE, msg.sender), "El usuario no es el administrador. Se requieren permisos para realizar esta accion.");
        revokeRole(MINTER_ROLE, minter);
    }

    function burnFromMinter(address account, uint256 amount) public {
        require(hasRole(DEFAULT_ADMIN_ROLE, msg.sender), "El usuario no es el administrador. Se requieren permisos para realizar esta accion.");
        require(hasRole(MINTER_ROLE, account), "No se puede realizar quema de tokens. La cuenta objetiva debe estar autorizada para mintear.");
        _burn(account, amount);
    }

    function totalSupply() public override view returns (uint256) {
        return super.totalSupply() / 1e18;
    }
}