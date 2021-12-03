pragma solidity ^0.8.0;

import "./StorageContract.sol";
contract Dogs is Storage{
    event showNumberOfDogs(uint256 number);
    function getNumberOfDogs() public view returns(uint256) {
        return Storage.getNumber();
    }
    
    function setNumberOfDogs(uint256 toSet) public {
        Storage.setNumber(toSet+1);
    }
}

contract DogsV2 is Storage {
  
    event showNumberOfDogs(uint256 number);
    function getNumberOfDogs() public  returns(uint256) {
        return Storage.getNumber();
    }
    
    function setNumberOfDogs(uint256 toSet) public {
        Storage.setNumber(toSet);
    }

}