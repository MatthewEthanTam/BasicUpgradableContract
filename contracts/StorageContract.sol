pragma solidity ^0.8.0;

contract Storage {
    uint256 number;
    function getNumber() internal view returns (uint256) {
        return number;
    }

    function setNumber(uint256 _number) internal {
        number = _number;
    }
}