// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Lottery{
    address public manager;
    address payable[] public players;
		// Constructor to assign contract deployer address to manager
    constructor() {
        manager = msg.sender;
    }
	
		// Function to enter the lottery
    function enter() public payable{
        require(msg.value > 0.01 ether);
        players.push(payable(msg.sender));
    }
	
		// Function to choose random address from the array of players
		// This is a private function so that it cannot be called directly
		// You will need to call this function from other functions
    function random() private view returns(uint){
        return uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp, players)));
    }

		// Pick winner calles random() function and gets a random user index
		// After getting the index the function transfers all the funds inside the contract to that players address
		// Pick winner is restricted so that only contract owner can call it
    function pick_winner() public restricted{
        // require(msg.sender == manager);
        uint index = random() % players.length;
        players[index].transfer(address(this).balance);
        // delete players;
        players = new address payable[](0);
    }
    
		// Get the length of players array
		// Returns the number of players currently inside the array
    function get_players_length() public view returns(uint){
        return players.length;
    }
		

		// Reyurns the whole array of players inside the array 
		// The array consists of wallet addresses of players
    function get_players() public view returns(address payable[] memory)
    {
        return players;
    }
	
		// You can define modifiers in solidity can assign them to functions
		// the "_" is replaced by all the contract code of the function.
    modifier restricted(){
        require(msg.sender == manager);
        // Compiler takes the code from other functions and adds it to the "_"
        // This is called as: "Dont repeat yourself"
        _;
    }
}