const { ethers } = require('hardhat');

module.exports = async () => {
    const LockFactory = await ethers.getContractFactory('Lock');
    const Lock = await LockFactory.deploy();
    await Lock.waitForDeployment();
    console.log(LockFactory);
}


module.exports.tags = ['all', 'Lock'];