//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";

contract Marketplace is Ownable(msg.sender), ReentrancyGuard{
    ERC20 public token; 
    uint256 public buyRate;    // Tasa para comprar tokens con Ether
    uint256 public sellRate;   // Tasa para vender tokens al contrato

    //Eventos
    event TokensPurchased(address indexed buyer, uint256 amount);
    event TokensSold(address indexed seller, uint256 amount);

    // Tasas iniciadas por el owner
    constructor(ERC20 _token, uint256 _buyRate, uint256 _sellRate) {
        require(_buyRate > 0, "La tasa de compra debe ser mayor que cero");
        require(_sellRate > 0, "La tasa de venta debe ser mayor que cero");
        token = _token;
        buyRate = _buyRate;
        sellRate = _sellRate;
    }

    function buyToken(uint256 tokenAmount) public payable nonReentrant{
        uint256 etherRequired = tokenAmount / buyRate;
        require(msg.value >= etherRequired, "Ether enviado insuficiente");
        require(token.balanceOf(address(this)) >= tokenAmount, "No hay suficientes tokens disponibles");
        token.transfer(msg.sender, tokenAmount); 
        emit TokensPurchased(msg.sender, tokenAmount);
    }

    function sellToken(uint256 tokenAmount) public nonReentrant {
        uint256 etherToPay = tokenAmount * sellRate;
        require(address(this).balance >= etherToPay, "No hay suficiente ether disponible para hacer el cambio");
        token.transferFrom(msg.sender, address(this), tokenAmount);
        payable(msg.sender).transfer(etherToPay);
        emit TokensSold(msg.sender, tokenAmount);
    }

    // Funciones para ajustar las tasas de compra y venta
    function updateBuyRate(uint256 newRate) public onlyOwner {
        require(newRate > 0, "La tasa de compra debe ser mayor que cero");
        buyRate = newRate;
    }

    function updateSellRate(uint256 newRate) public onlyOwner {
        require(newRate > 0, "La tasa de venta debe ser mayor que cero");
        sellRate = newRate;
    }

    // Owner-only function to withdraw all Ether from the contract
    function withdrawAllEth() public onlyOwner {
        uint256 balance = address(this).balance;
        require(balance > 0, "No hay Ether para retirar");
        payable(owner()).transfer(balance);
    }

    // Owner-only function to withdraw all tokens from the contract
    function withdrawAllTokens() public onlyOwner {
        uint256 tokenBalance = token.balanceOf(address(this));
        require(tokenBalance > 0, "No hay tokens para retirar");
        token.transfer(owner(), tokenBalance);
    }

    receive() external payable {
        // This function will be triggered whenever the contract receives Ether with no data.
    }
}