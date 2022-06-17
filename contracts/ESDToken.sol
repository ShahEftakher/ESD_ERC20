// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract ESDToken is ERC20 {
    address private admin;
    uint256 maxCirculation;

    constructor(
        uint256 _initialSupply,
        address _admin,
        uint256 _maxCirculation
    ) ERC20("ESD Token", "ESD") {
        admin = _admin;
        maxCirculation = _maxCirculation;
        _mint(msg.sender, toESDwei(_initialSupply));
    }

    modifier onlyOwner() {
        require(msg.sender == admin, "Admin only operation");
        _;
    }

    function toESDwei(uint256 _ESD) internal view returns (uint256) {
        return _ESD * 10**decimals();
    }

    function mintESD(uint256 _amount) external onlyOwner {
        // require(totalSupply() + _amount <= maxCirculation, "Exceeding limit");
        _mint(msg.sender, toESDwei(_amount));
    }

    //external tranfer fn
    function transferTo(address _to, uint256 _amount) external {
        transfer(_to, toESDwei(_amount));
    }

    //external _transerFrom
    function _transferFrom(
        address _from,
        address _to,
        uint256 _amount
    ) external {
        transferFrom(_from, _to, toESDwei(_amount));
    }

    //external approve
    function approveTx(address _spender, uint256 _amount) external {
        approve(_spender, toESDwei(_amount));
    }


    //override decimal
    function decimals() public view virtual override returns (uint8) {
        return 10;
    }
}
