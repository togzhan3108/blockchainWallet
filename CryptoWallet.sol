// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

// Get the latest ETH/USD price from chainlink price feed
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract CryptoWallet {
    address payable[] recipients;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function getBalance() public view returns(uint256){
        return address(this).balance;
    }

    function send_ETH(address payable recipient) payable public {
        fund(recipient);
    }
   
    function fund(address payable recipient) internal {
        recipient.transfer(address(this).balance);
    }

    function getPrice() public view returns(uint256){
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
        (,int256 answer,,,) = priceFeed.latestRoundData();
         // ETH/USD rate in 18 digit 
         return uint256(answer * 10000000000);
    }

    function getConversionRate(uint256 ethAmount) public view returns (uint256){
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1000000000000000000;
        // the actual ETH/USD conversation rate, after adjusting the extra 0s.
        return ethAmountInUsd;
    }
}
