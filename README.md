# NFT SMART CONTRACT

## See the collection on OpenSea : https://testnets.opensea.io/collection/opensea-creatures-108

1. **Imports**: This contract imports two other contracts from OpenZeppelin's library, ERC721 for ERC721 standard functionality (NFT creation, ownership, etc.) and Ownable for ownership related functionality (onlyOwner modifier).

2. **Rabbits Contract**: This contract is a subclass of ERC721 and Ownable contracts with additional features. The contract mints ERC721 tokens (Rabbits) and tracks their ownership.

3. **State Variables**: 
   - _nextTokenId is a private variable used to track the next tokenId to be minted. It's initialized to 0.
   - baseURI is a private string variable used to store base URI for token URIs.
   - walletMints is a mapping from an address to a uint256 tracking how many tokens have been minted by each address.
   - URIQueryForNonExistentToken is a custom error thrown when trying to get a token URI for a non-existent token.

4. **Constructor**: The constructor initializes baseURI with a string argument uri and sets initialOwner as owner of this contract.

5. **Functions**: 
   - _baseURI returns the current baseURI string.
   - setBaseURI allows owner to set a new baseURI string.
   - safeMint mints a new token to sender's address (only owner can call this). It increments _nextTokenId and walletMints[msg.sender] by 1.
   - contractURI returns a fixed string (IPFS link) for OpenSea metadata.
   - tokenURI returns a token URI string for a given tokenId. If tokenId is not valid (greater than or equal to _nextTokenId), it reverts with custom error URIQueryForNonExistentToken. The URI is composed of baseURI, tokenId (as a string), and ".json".
   - getBalance returns how many tokens an address owns. This is a simple balance checker for this contract. It returns balance of given address.

6. **Function contractURI()**:
   - Opensea expects this function to create NFT collection for contracts ERC721 and ERC1155, it must contain a JSON file similar to : 

{
    "name": "OpenSea Creatures",
    "description": "OpenSea Creatures are adorable beings primarily for demonstrating what can be done using the OpenSea platform. Adopt one today to try out all the OpenSea buying, selling, and bidding feature set.",
    "image": "https://violet-tiny-ocelot-777.mypinata.cloud/ipfs/QmcfxpxZFB4szGooppDTsscefKwoq8eDwkSic8JgwHKh5w/1.jpg",
    "banner_image": "https://violet-tiny-ocelot-777.mypinata.cloud/ipfs/QmcfxpxZFB4szGooppDTsscefKwoq8eDwkSic8JgwHKh5w/1.jpg",
    "external_link": "https://github.com/iamcarllosjr",
    "collaborators": ["0xA5216C6F685c2b8a678A704107760Be652665234"]
  }

## This contract can be deployed on Ethereum blockchain to create a collection of NFTs (Rabbits). Owner of this contract can mint new tokens, set base URI for tokens, check how many tokens an address owns etc. It's a simple example of how to create an NFT collection with ERC721 standard using OpenZeppelin's contracts in Solidity.
