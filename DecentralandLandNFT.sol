// SPDX-License-Identifier: MIT
pragma solidity 0.8.34;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title DecentralandLandNFT
 * @dev Contrato inteligente basado en el estándar ERC-721 para la gestión de parcelas de tierra 
 * virtual (LAND) como tokens no fungibles, inspirado en Decentraland.
 */
contract DecentralandLandNFT is ERC721, Ownable {
    uint256 private _tokenIds;

    // Estructura para almacenar las coordenadas espaciales de la parcela en el metaverso
    struct LandParcel {
        int x;
        int y;
    }

    // Mapeo del ID del NFT hacia sus coordenadas espaciales
    mapping(uint256 => LandParcel) public parcels;

    constructor() ERC721("Decentraland LAND", "LAND") Ownable(msg.sender) {}

    /**
     * @dev Permite acuñar (mint) una nueva parcela virtual asignándole coordenadas (x, y) únicas.
     */
    function mintLand(address recipient, int x, int y) public onlyOwner returns (uint256) {
        uint256 newItemId = _tokenIds++;
        _safeMint(recipient, newItemId);
        parcels[newItemId] = LandParcel(x, y);
        return newItemId;
    }
}