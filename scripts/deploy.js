const { deployments, getNamedAccounts, run } = require('hardhat');
const { verify } = require('../hardhat-config-helper.js');

const main = async () => {
    // Getting deploy function..
    const { deploy, log } = deployments;

    // Getting wallet address..
    const { deployer } = await getNamedAccounts();

    // Deploying Contract..
    const MarketPlace = await deploy('MarketPlace', {
        from: deployer,
        args: [],
        log: true
    });

    // let tx = await MarketPlace.setNumb(22);
    // tx.wait(1);
    //console.log(MarketPlace);
    // Verifying contract on etherscan..
    verify(MarketPlace.address, [])

    // Returning contract..
    return MarketPlace.address;
}

main()
.then((res) => {
    console.log(`MarketPlace address: ${res}`);
    return res;
})
.catch((err) => {
    console.log(err);
})