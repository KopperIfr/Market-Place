const { ethers } = require('hardhat');

const main = async () => {
    
    // Deploying MarketPlace Contract..
    const MarketPlaceFactory = await ethers.getContractFactory('MarketPlace');
    const MarketPlace = await MarketPlaceFactory.deploy(23987,);
    await MarketPlace.waitForDeployment();

    return {MarketPlace}
}

main()
.then((res) => {
    console.log(res);
})
.catch((err) => {
    console.log(err);
})