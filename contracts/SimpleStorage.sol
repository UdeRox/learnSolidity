//SimpleStorage.sol
// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract SimpleStorage {
    uint256 public favoritNumner;
    struct Person {
        uint256 favoritNumber;
        string name;
    }
    //

    Person[] public persons;
    mapping (string => uint256) public mapPersons;
    // Person public myfriend = Person({favoritNumner:100,name:"Udeshika"});
    Person public myfriend = Person(300, "Udeshika");

    function store(uint256 _number) public virtual {
        // persons.push(Person({name: _name, favoritNumber: _number}));
        // mapPersons[_name] = _number;
        favoritNumner = _number;
    }

    function retrieve() public view returns (uint256) {
        return favoritNumner;
    }
}
