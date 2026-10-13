// SPDX-License-Identifier: MIT
pragma solidity 0.8.34;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title AaveDepositToken
 * @dev Contrato inteligente basado en el estándar ERC-20 para la gestión de depósitos 
 * y activos fungibles, inspirado en el modelo de finanzas descentralizadas (DeFi) de Aave.
 */
contract AaveDepositToken is ERC20, Ownable {
    uint256 public constant INITIAL_SUPPLY = 1_000_000 * 10 ** 18;

    constructor() ERC20("Aave Deposit Token", "aWETH") Ownable(msg.sender) {
        _mint(msg.sender, INITIAL_SUPPLY);
    }

    /**
     * @dev Permite al propietario emitir (mint) nuevos tokens de depósito para simular la liquidez.
     */
    function deposit(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
}