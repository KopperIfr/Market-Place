// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract NFT is ERC721, Ownable {
    uint256 public tokenCounter;
    mapping(uint256 => string) private _tokenURIs;

    constructor(string memory _name, string memory _symbol) Ownable(msg.sender)
    ERC721 (_name, _symbol)
    {
        tokenCounter = 0;
    }

// Función para crear un nuevo NFT
    function createNFT(address to) public onlyOwner {
        _safeMint(to, tokenCounter); // Crea un nuevo NFT con un ID único (tokenCounter)
        tokenCounter++; // Incrementar el contador de tokens
    }

    // Sobrescribir tokenURI para proporcionar metadatos del NFT
    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
        
    }

}