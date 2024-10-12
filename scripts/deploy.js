const { ethers, network } = require('hardhat');

const main = async () => {

    console.log(network.config.chainId);
    
    // Deploying MarketPlace Contract..
    const MarketPlaceFactory = await ethers.getContractFactory('MarketPlace');
    const MarketPlace = await MarketPlaceFactory.deploy(23987,);
    await MarketPlace.waitForDeployment();

    return MarketPlace.target;
}

main()
.then((res) => {
    console.log(res);
})
.catch((err) => {
    console.log(err);
})