const { deployments, getNamedAccounts, run } = require('hardhat');

const main = async () => {

    // Getting deploy function..
    const { deploy, log } = deployments;

    // Getting wallet address..
    const { deployer } = await getNamedAccounts();

    // Deploying Contract..
    const MarketPlace = await deploy('MarketPlace', {
        from: deployer,
        args: [267],
        log: true
    });

    // Returning contract..
    return MarketPlace.address;
}

main()
.then((res) => {
    console.log(`MarketPlace address: ${res}`);
})
.catch((err) => {
    console.log(err);
})