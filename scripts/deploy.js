const { ethers } = require("hardhat");

async function main() {
  /*
    A ContractFactory in ethers.js is an abstraction used to deploy new smart contract,
    so whitelistContract here is a factory for instance of our Whitelist contract. 
  */
  const whitelistContract = await ethers.getContractFactory("Whitelist");

  // here we deploy contract. 
  const deployedWhitelistContract = await whitelistContract.deploy(10);
  // 10 is the Maximum number of whitelist address allowed

  // Wait for it to finish deploying
  await deployedWhitelistContract.deployed();

  // print the address contract to console
  console.log('Whitelist address contract : ', deployedWhitelistContract.address);
}

// Call the main function and catch if there is any error;
main()
  .then(() => process.exit(0))
  .catch((e) => {
    console.log(e);
    process.exit(1);
  });
