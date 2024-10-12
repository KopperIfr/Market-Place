const { network } = require('hardhat');

module.exports = async ({getNamedAccounts, deployment}) => {
    const { deploy, log } = deployment;
    const { deployer } = await getNamedAccounts();

    const Lock = await deploy('Lock', {
        from: deployer
    })

    console.log(Lock.address);
}

module.exports.tag = ['all', 'MarketPlace'];