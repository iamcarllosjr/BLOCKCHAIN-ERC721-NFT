// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Rabbits is ERC721, Ownable {
    uint256 private _nextTokenId;
    string private baseURI;
    string private contractBaseURI;

    mapping(address => uint256) public walletMints;

    error URIQueryForNonExistentToken();

    // Set token URI JSON file from your collection
    constructor(address initialOwner_, string memory uri_, string memory contractURI_)
        ERC721("Rabbits", "RBT")
        Ownable(initialOwner_)
    {
        baseURI = uri_;
        contractBaseURI = contractURI_;
    }

    function safeMint() public onlyOwner {
        uint256 tokenId = _nextTokenId++;
         walletMints[msg.sender] += 1;
        _safeMint(msg.sender, tokenId);
    }

    function _baseURI() internal view override returns (string memory) {
        return baseURI;
    }

    // Set baseURI url for tokens
    function setBaseURI(string memory baseURI_) external onlyOwner {
        baseURI = baseURI_;
    }

    // contractURI() Opensea expects this function to create NFT collection for contracts ERC721 and ERC1155
    // https://ipfs.io/ipfs/QmUQxZdz7r2qcVG6wKyESswyjvgo8dhQWMoKhkp43ERZbb
    function contractURI() external view returns (string memory) {
        return contractBaseURI;
    }

    // Set contractURI json for OpenSea colletion
    function setContractURI(string memory newContractURI) external onlyOwner {
        contractBaseURI = newContractURI ;
    }

    // The following functions are overrides required by Solidity.
    function tokenURI(uint256 tokenId)
        public
        view
        override
        returns (string memory)
    {
        // Check if the tokenId is valid
        if (tokenId >= _nextTokenId) {
        revert URIQueryForNonExistentToken();
    }
        return string(abi.encodePacked(baseURI, Strings.toString(tokenId), ".json"));
    }

    function getBalance(address _ownerOf) public view returns (uint){
        return balanceOf(_ownerOf);
    }
}