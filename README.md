# Decentralized Donation App

## Overview
This project is a decentralized donation platform built using Solidity and deployed on the Ethereum Sepolia testnet. It integrates Chainlink oracles for USD price enforcement and employs industry-standard security practices.

## Features
- ETH donations with a minimum USD value.
- Secure withdrawals by the contract owner.
- Event logging for transparency.
- Protection against reentrancy attacks.

## Contract Addresses
- Donation.sol: [Sepolia Address]
- PriceConverter.sol: [Sepolia Address]

## Challenges
- Integrating Chainlink price feeds.
- Debugging edge cases during withdrawals.
- Implementing gas-optimized reentrancy protection.

## Insights
- Learned how to use Chainlink's AggregatorV3Interface.
- Understood the importance of CEI patterns for secure Solidity coding.
