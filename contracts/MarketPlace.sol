// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

contract MarketPlace {

    uint256 numb;

    function setNumb(uint256 _numb) public {
        numb = _numb;
    }

    function getNumb() public view returns(uint256) {
        return numb;
    }
}




// module.exports = async({getNamedAccounts, deployments}) => {
//     const { deploy } = deployments;
//     const { deployer } = await getNamedAccounts();

//     const MarketPlace = await deploy('MarketPlace', {
//         from: deployer,
//         args: [],
//         log: true
//     })

//     let tx = await MarketPlace.getNumb();
// }


// module.exports.tags = ['all', 'MarketPlace'];