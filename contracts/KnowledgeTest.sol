//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract KnowledgeTest {
    string[] public tokens = ["BTC", "ETH"];
    address[] public players;

    // my code
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    receive() external payable {

    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function transferAll(address payable recip) external {
        require(owner == msg.sender, "ONLY_OWNER");
        uint256 balance = address(this).balance;
        recip.transfer(balance);
    }

    function start() public {
        players.push(msg.sender);
    }

    // test fails when not 'pure'
    function concatenate(string calldata a, string calldata b) external pure returns (string memory) {
        return string(abi.encodePacked(a, b));
    }

    // end of my code

    function changeTokens() public {
        string[] storage t = tokens;
        t[0] = "VET";
    }
}
