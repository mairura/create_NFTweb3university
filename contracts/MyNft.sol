//Contract based on https://docs.openzeppelin.com/contracts/3.x/erc721
// SPDX-License-Identifier: MIT
pragma solidity ^0.7.3;

//Inherits OpenZepplin smart contracts
import "@openzeppelin/contracts/token/ERC721/ERC721.sol"; //contains implementation of ERC721 standard
import "@openzeppelin/contracts/utils/Counters.sol"; //Provides counters that can only be increamented or decreamented by one to keep track of number of NFTs mined
//with a set of unique IDs 
import "@openzeppelin/contracts/access/Ownable.sol"; //Sets up access control of our Smart contract, only owner(me) can be able to mint NFTs

contract MyNFT is ERC721, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor() public ERC721("MyNFT", "tedNFT") {}

    function mintNFT(address recipient, string memory tokenURI) public onlyOwner returns (uint256){
        _tokenIds.increment();

        uint256 newItemId = _tokenIds.current();
        _mint(recipient, newItemId);
        _setTokenURI(newItemId, tokenURI);

        return newItemId;
    }

}