const { deployments, getNamedAccounts, ethers } = require('hardhat');
const { verify } = require('../hardhat-config-helper.js');
const { parseEther } = ethers;

const main = async () => {
    // Getting deploy function..
    const { deploy, log } = deployments;

    // Getting wallet address..
    const { deployer } = await getNamedAccounts();

    // Deploying Contract..
    const CafeToken = await deploy('CafeToken', {
        from: deployer,
        args: [],
        log: true
    });

    // Verifying contract on etherscan..
    verify(CafeToken.address, [])

    console.log(CafeToken);

    // Returning contract..
    return CafeToken.address;
}

main()
.then((res) => {
    console.log(`CafeToken address: ${res}`);
    return res;
})
.catch((err) => {
    console.log(err);
})