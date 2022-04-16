// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Array_test{

    // Accepts index and returns the element at index
    uint[] public my_arr;

    // This is a constructor, which initilizes the array
    constructor() {
        my_arr.push(10);
        my_arr.push(1);
        my_arr.push(70);
    }

    // Get the length of array
    function getArray_length() public view returns(uint){
        return my_arr.length;
    }

    // Get the first elemet of an array
    function get_first_ele() public view returns(uint){
        return my_arr[0];
    }

    // Get whole array
    function arr_returns() public view returns(uint[] memory)
    {
        return my_arr;
    }
}