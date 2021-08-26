// SPDX-License-Identifier: CC0-1.0
pragma solidity ^0.8.0;

// modules
import "./ERC725XInit.sol";
import "./ERC725YInit.sol";

/**
 * @title ERC725 bundle
 * @dev Bundles ERC725X and ERC725Y together into one smart contract
 *
 *  @author Fabian Vogelsteller <fabian@lukso.network>
 */
contract ERC725Init is Initializable, ERC725XInit, ERC725YInit {

    /**
     * // @notice Sets the owner of the contract
     * // @param _newOwner the owner of the contract.
     */
    function initialize(address _newOwner) virtual override(ERC725XInit, ERC725YInit) public initializer {
        ERC725XInit.initialize(_newOwner);
        ERC725YInit.initialize(_newOwner);
    }
    // constructor(address _newOwner)
    // ERC725X(_newOwner)
    // ERC725Y(_newOwner)
    // {}

    // NOTE this implementation has not by default: receive() external payable {}
}