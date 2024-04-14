// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Rabbits is ERC721, Ownable {
    uint256 private _nextTokenId;
    string private baseURI;

    mapping(address => uint256) public walletMints;

    error URIQueryForNonExistentToken();

    // Set token URI JSON file from your collection
    constructor(address initialOwner, string memory uri)
        ERC721("Rabbits", "RBT")
        Ownable(initialOwner)
    {
        baseURI = uri;
    }

    function _baseURI() internal view override returns (string memory) {
        return baseURI;
    }

    function setBaseURI(string memory baseURI_) external onlyOwner {
        baseURI = baseURI_;
    }

    function safeMint() public onlyOwner {
        uint256 tokenId = _nextTokenId++;
         walletMints[msg.sender] += 1;
        _safeMint(msg.sender, tokenId);
    }

    // Opensea expects this function to create NFT collection for contracts ERC721 and ERC1155
    function contractURI() external pure returns (string memory) {
        return "https://bafybeicjw4vwoi37i54mlelcx2vtsixr5uwebf7thwhdmjg4ftho7436be.ipfs.dweb.link/";
    }

    // The following functions are overrides required by Solidity.
    function tokenURI(uint256 tokenId)
        public
        view
        override
        returns (string memory)
    {
        // Verifica se o tokenId é válido
        if (tokenId >= _nextTokenId) {
        // Lança o erro personalizado se o tokenId não existir
        revert URIQueryForNonExistentToken();
    }
        return string(abi.encodePacked(baseURI, Strings.toString(tokenId), ".json"));
    }

    function getBalance(address _ownerOf) public view returns (uint){
        return balanceOf(_ownerOf);
    }
}