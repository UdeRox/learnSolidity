// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe {
    uint256 public minimumUsd = 5e18;
    // uint256 public minimumUsd = 5;
    AggregatorV3Interface internal dataFeed;

    address[] public founders;
    mapping(address => uint256) public founderToAmountFounded;

    constructor() {
        dataFeed = AggregatorV3Interface(
            0x694AA1769357215DE4FAC081bf1f309aDC325306
        );
    }

    function fund() public payable {
        require(getConversionRate(msg.value) >= minimumUsd, "Didn't send enoguh ETH");
        founders.push(msg.sender);
        founderToAmountFounded[msg.sender] =
            founderToAmountFounded[msg.sender] +
            msg.value;
    }

    function getConversionRate (uint256 ethAmount) public view returns (uint256){
        uint256 ethPrice = getPrice();
        uint256 price = (ethAmount * ethPrice) / 1e18;
        return price;
    }

    function getPrice() public view returns (uint256) {
        // prettier-ignore
        (
            /* uint80 roundID */,
            int answer,
            /*uint startedAt*/,
            /*uint timeStamp*/,
            /*uint80 answeredInRound*/
        ) = dataFeed.latestRoundData();
        return uint256(answer * 1e10);
    }

    function getVersion() public view returns (uint256) {
        return dataFeed.version();
    }

    function getDecimal() public view returns (uint256) {
        return  dataFeed.decimals();
    }
}
