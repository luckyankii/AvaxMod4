
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract ChooseFriendsWisely is ERC20, Ownable {
    mapping(address => bool) private ItemsRedeemed;
    uint public constant Loot = 1000 * 10;

    constructor() ERC20("ChooseFriendsWisely", "CFW") {
        _mint(msg.sender, Loot);
    }

    function mint(address acnt, uint amnt) public onlyOwner {
        _mint(acnt, amnt);
    }

    function redeemItem() public {
        require(balanceOf(msg.sender) >= Loot, "Balance is insufficient");
        require(!ItemsRedeemed[msg.sender], "Items are redeemed already");

        ItemsRedeemed[msg.sender] = true;
        _burn(msg.sender, Loot);
    }

    function burn(uint amnt) public {
        _burn(msg.sender, amnt);
    }
}
