const { ethers } = require('hardhat');

module.exports = async({ getNamedAccounts, deployments }) => {
    const { deploy } = deployments;
    const { deployer } = await getNamedAccounts();

    console.log('Deploying Marketplace..');

    const MarketPlace = await deploy('MarketPlace', {
        from: deployer,
        args: [],
        log: true
    })

    console.log(`Marketplace deployed at: ${MarketPlace.address}`);
}


module.exports.tags = ['all', 'MarketPlace'];