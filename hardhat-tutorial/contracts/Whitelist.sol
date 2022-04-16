//SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.0;

contract Whitelist{

    uint8 public maxWhiteListedAddresses;
    uint8 public numAddressesWhiteListed;

    mapping(address => bool) public whitelistedAddresses;

    constructor(uint8 _maxWhiteListedAddresses){
        maxWhiteListedAddresses = _maxWhiteListedAddresses;
    }

    function addAddressToWhitelist() public{
        require(!whitelistedAddresses[msg.sender], "You are already whitelisted");
        require(numAddressesWhiteListed < maxWhiteListedAddresses, "Maximum limit reached");

        whitelistedAddresses[msg.sender] = true;
        numAddressesWhiteListed += 1;
    }

}