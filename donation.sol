// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "./PriceConverter.sol";

contract Donation {
    using PriceConverter for uint256;

    address public owner;
    uint256 public constant MIN_USD = 50 * 1e18; // $50 in Wei
    address[] public donors;
    mapping(address => uint256) public donations;

    event DonationReceived(address indexed donor, uint256 amount, uint256 usdValue);
    event FundsWithdrawn(address indexed owner, uint256 amount);

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    function fund() public payable {
        uint256 usdValue = msg.value.getConversionRate();
        require(usdValue >= MIN_USD, "Donation must be at least $50 in ETH");

        if (donations[msg.sender] == 0) {
            donors.push(msg.sender);
        }
        donations[msg.sender] += msg.value;

        emit DonationReceived(msg.sender, msg.value, usdValue);
    }

    function withdraw() public onlyOwner {
        uint256 balance = address(this).balance;
        require(balance > 0, "No funds to withdraw");

        emit FundsWithdrawn(msg.sender, balance);

        (bool success, ) = owner.call{value: balance}("");
        require(success, "Withdrawal failed");
    }

    receive() external payable {
        fund();
    }
}
