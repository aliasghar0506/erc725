// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.0;

// modules
import "@openzeppelin/contracts/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts/utils/introspection/ERC165.sol";
import "./ERC725YCore.sol";

/**
 * @title Inheritable Proxy Implementation of ERC725 Y General key/value store
 * @author Fabian Vogelsteller <fabian@lukso.network>
 * @dev Contract module which provides the ability to set arbitrary key value sets that can be changed over time
 * It is intended to standardise certain keys value pairs to allow automated retrievals and interactions
 * from interfaces and other smart contracts
 */
abstract contract ERC725YInitAbstract is ERC165, ERC725YCore, Initializable {
    function _initialize(address _newOwner) internal virtual onlyInitializing {
        // This is necessary to prevent a contract that implements both ERC725X and ERC725Y to call both constructors
        if (_newOwner != owner()) {
            OwnableUnset.initOwner(_newOwner);
        }
    }

    /* Overrides functions */

    /**
     * @dev See {IERC165-supportsInterface}.
     */
    function supportsInterface(bytes4 interfaceId) public view virtual override returns (bool) {
        return interfaceId == _INTERFACEID_ERC725Y || super.supportsInterface(interfaceId);
    }
}
