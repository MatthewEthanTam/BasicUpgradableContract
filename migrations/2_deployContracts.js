const StorageContract = artifacts.require("Storage");
const FunctionalContractv1 = artifacts.require("Dogs");
const FunctionalContractv2 = artifacts.require("DogsV2");
const ProxyContract = artifacts.require("proxyDog");

module.exports = async function (deployer, network, accounts) {
  await deployer.deploy(StorageContract);
  await deployer.deploy(FunctionalContractv1);
  let func = await FunctionalContractv1.deployed();
  console.log(await func.address);
  await deployer.deploy(ProxyContract,func.address);
  

  let pDog = await ProxyContract.deployed();
  await pDog.setNumberOfDogs(5);
  console.log(await pDog.getNumberOfDogs());
  console.log(await pDog.getCurrentAddress()); // Version 1 address;

  await deployer.deploy(FunctionalContractv2);
  let func2 = await FunctionalContractv2.deployed();
  await pDog.upgradeContract(func2.address);
  console.log(await pDog.getCurrentAddress()); // Version 2 address;

};
