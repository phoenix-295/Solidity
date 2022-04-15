// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Storage {
    
    function check_pass(string memory usr, string memory pass) public pure returns (bool){
        if ((keccak256(bytes(usr)) == keccak256(bytes("Nik"))) && keccak256(bytes(pass)) == keccak256(bytes("123"))){
            return true;
        } else {
            return false;
        }
    }

}