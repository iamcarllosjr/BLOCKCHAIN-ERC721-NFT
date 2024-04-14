# NFT SMART CONTRACT

## See the collection on OpenSea : https://testnets.opensea.io/collection/opensea-creatures-107

### string private baseURI : Variable to store the URI of the tokens, the URI is defined in the contract constructor, when deploying.

### function _baseURI() : Function to return the URI saved in the variable baseURI, and also override the _baseURI() function within the ERC721 contract

###  function setBaseURI() : Function to change the URI of tokens.

### function contractURI() : Opensea expects this function to create NFT collection for contracts ERC721 and ERC1155, it must contain a JSON file similar to : 

{
    "name": "OpenSea Creatures",
    "description": "OpenSea Creatures are adorable aquatic beings primarily for demonstrating what can be done using the OpenSea platform. Adopt one today to try out all the OpenSea buying, selling, and bidding feature set.",
    "image": "https://violet-tiny-ocelot-777.mypinata.cloud/ipfs/QmcfxpxZFB4szGooppDTsscefKwoq8eDwkSic8JgwHKh5w/1.jpg",
    "external_link": "https://github.com/iamcarllosjr",
    "collaborators": ["0xA5216C6F685c2b8a678A704107760Be652665234"]
  }

### function tokenURI() : It is used to override the tokenURI() function in the ERC721 contract, it also returns the URI of tokens concatenated with ".json".
