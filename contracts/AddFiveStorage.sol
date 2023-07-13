// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
import {SimpleStorage} from "./SimpleStorage.sol";

contract AddFiveStorage is SimpleStorage {
    function sayHello() public pure returns (string memory) {
        return "Hello";
    }

    function store(uint256 _newNumber) public override {
        favoritNumner = _newNumber + 5;
    }
}
