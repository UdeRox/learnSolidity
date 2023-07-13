// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import {SimpleStorage} from "./SimpleStorage.sol";

contract StorageFactory {
    SimpleStorage[] public listOfSimpleStorage;

    function createSimpleStorageContract () public {
        SimpleStorage simpleStorage = new SimpleStorage();
        listOfSimpleStorage.push(simpleStorage);
    }

    function fsStore(uint256 _simpleStorageIndex,uint _simpleStorageNumber) public {
        SimpleStorage mySimpleStorage = listOfSimpleStorage[_simpleStorageIndex];
        mySimpleStorage.store(_simpleStorageNumber);
    }

    function fsRetreive (uint256 _index) public view returns(uint256){
        SimpleStorage mySimpleStorage  = listOfSimpleStorage[_index];
        return mySimpleStorage.retrieve();
    }
}