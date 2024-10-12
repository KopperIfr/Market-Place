const { TOTAL_SUPPLY } = require('../hardhat-config-helper.js');

module.exports = async({ getNamedAccounts, deployments }) => {
    const { deploy } = deployments;
    const { deployer } = await getNamedAccounts();

    console.log('Deploying Token..');

    const Token = await deploy('Token', {
        from: deployer,
        args: [TOTAL_SUPPLY, 'SPRINT', 'SPT'],
        log: true
    })

    console.log('Token deployed!');
    const TokenContract = await ethers.getContractAt('Token', Token.address);
    const name = await TokenContract.name();
    const symbol = await TokenContract.symbol();
    const supply = await TokenContract.totalSupply();

    console.log(`${name} (${symbol}) deployed at ${Token.address}, total supply: ${supply}`);
}


module.exports.tags = ['all', 'MarketPlace'];