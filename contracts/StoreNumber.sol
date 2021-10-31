// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LotteryContract {
    struct GuessNum {
        uint8 first;
        uint8 second;
        uint8 third;
    }
    
    event SettingNumber(uint8 first, uint8 second, uint8 third);
    
    mapping(address => GuessNum) private guessNums;
    mapping(address => uint8[3]) selectedNums;
    
    function setNumber(uint8 _first, uint8 _second, uint8 _third) public {
        guessNums[msg.sender] = GuessNum(_first, _second, _third);
        selectedNums[msg.sender] = [_first, _second, _third];
        emit SettingNumber(_first, _second, _third);
    }
    
    function getNumber() public view returns (uint8 first, uint8 second, uint8 third) {
        GuessNum memory guessNum  = guessNums[msg.sender];
        first = guessNum.first;
        second = guessNum.second;
        third = guessNum.third;
    }
    
    function getNumbers() public view returns (uint8 first, uint8 second, uint8 third) {
        uint8[3] memory selectedNum = selectedNums[msg.sender];
        first = selectedNum[0];
        second = selectedNum[1];
        third = selectedNum[2];
    }
}