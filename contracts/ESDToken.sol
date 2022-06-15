// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract ESDToken is ERC20 {
    address private admin;
    uint256 totalCirculation;

    constructor(
        uint256 _initialSupply,
        address _admin,
        uint256 _totalCirculation
    ) ERC20("ESD Token", "ESD") {
        admin = _admin;
        totalCirculation = _totalCirculation;
        _mint(msg.sender, _initialSupply);
    }

    modifier onlyOwner() {
        require(msg.sender == admin, "Admin only operation");
        _;
    }

    function mintESD(uint256 _amount) external onlyOwner {
        // require(totalSupply() + _amount <= totalCirculation, "Exceeding limit");
        _mint(msg.sender, _amount);
    }
}
