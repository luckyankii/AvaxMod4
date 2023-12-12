
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract ChooseFriendsWisely is ERC20, Ownable(msg.sender)  {
    mapping(address => bool) private ItemsRedeemed;
    uint public constant bal = 1000;

    constructor() ERC20("ChooseFriendsWisely", "CFW") {
        _mint(msg.sender, bal);
    }

    function mint(address acnt, uint amnt) public onlyOwner {
        _mint(acnt, amnt);
    }

    function redeemItem() public {
        require(balanceOf(msg.sender) >= bal, "Balance is insufficient");
        require(!ItemsRedeemed[msg.sender], "Items are redeemed already");

        ItemsRedeemed[msg.sender] = true;
        _burn(msg.sender, bal);
    }

    function burn(uint amnt) public {
        _burn(msg.sender, amnt);
    }
}
