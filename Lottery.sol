// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Lottery{
    address public manager;
    address payable[] public players;
    constructor() {
        manager = msg.sender;
    }

    function enter() public payable{
        require(msg.value > 0.01 ether);
        players.push(payable(msg.sender));
    }

    function random() private view returns(uint){
        return uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp, players)));
    }

    function pick_winner() public restricted{
        // require(msg.sender == manager);
        uint index = random() % players.length;
        players[index].transfer(address(this).balance);
        // delete players;
        players = new address payable[](0);
    }
    
    function get_players_length() public view returns(uint){
        return players.length;
    }

    function get_players() public view returns(address payable[] memory)
    {
        return players;
    }

    modifier restricted(){
        require(msg.sender == manager);
        // Compiler takes the code from other functions and adds it to the "_"
        // This is called as: "Dont repeat yourself"
        _;
    }
}