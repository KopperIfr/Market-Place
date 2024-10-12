// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;


contract MarketPlace {

    uint256 numb = 12;

    constructor(uint256 _numb) {
        numb = _numb;
    }

    function getNumb() public view returns(uint256) {
        return numb;
    }


}