// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

contract Whitelist {
    // Max number of whitelisted address allowed.
    uint8 public maxWhitelistedAddresses;

    // Create a mapping whitelistedAddresses
    // if an address is whitelisted, we would set it to true, it is false by default for all other addresses.
    mapping(address => bool) public whitelistedAddresses;

    // Keep track how mnay addresses have been whitelisted
    uint8 public numAddressesWhitelisted;

    // Setting the Max number of whitelist address
    // User will put the value at the time of deployment
    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    /**
        addAddressToWhitelist - This function adds the address of the sender to the
        whitelist
     */

    function addAddressToWhitelist() public {
        // check if the user has already been whitelisted
        require(
            !whitelistedAddresses[msg.sender],
            "Sender has already been whitelisted"
        );

        // check if the numAdressesWhitelisted <= maxWhitelistedAddresses, if not then throw an error
        require(
            numAddressesWhitelisted <= maxWhitelistedAddresses,
            "More address can't be added, limit reached"
        );

        // Add the address
        whitelistedAddresses[msg.sender] = true;

        // Increase the number of whitelist address
        numAddressesWhitelisted += 1;
    }
}
