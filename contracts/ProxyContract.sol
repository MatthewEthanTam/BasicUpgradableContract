pragma solidity ^0.8.0;

import "./StorageContract.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
contract proxyDog is Storage,Ownable {
    address public currentAddress;

    constructor(address _currentAddress) {
        currentAddress = _currentAddress;
    }

    function upgradeContract(address _currentAddress) public onlyOwner {
        currentAddress = _currentAddress;
    }

    function getNumberOfDogs() public returns (bool ,bytes memory) {
        (bool res, bytes memory data) = currentAddress.delegatecall(abi.encodePacked(bytes4(keccak256("getNumberOfDogs()")))); //calls getNumberOfDogs in the contract at currentAddress
        return (res,data);
    }

    function setNumberOfDogs(uint256 _number) public returns (bool ,bytes memory) {
        (bool res, bytes memory data) = currentAddress.delegatecall(abi.encodePacked(bytes4(keccak256("setNumberOfDogs(uint256)")), _number)); //calls setNumberOfDogs in the contract at currentAddress
        return (res,data);
    }

    function getCurrentAddress () public view returns (address){
        return currentAddress;
    }
}