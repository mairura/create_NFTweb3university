const { ethers } = require("hardhat");

async function main() {
    //Grab the contract factory
    const MyNFT = await ethers.getContractFactory("MyNFT"); // ContractFactory is an abstraction used to deploy new smart contracts 

    //Start deployment
    const myNFT = await MyNFT.deploy(); //Instance of the contract
    console.log("Contract deployed on address: ", myNFT.address);
}

main().then(() => process.exit(0)).catch(error => {
    console.error(error);
    process.exit(1);
});