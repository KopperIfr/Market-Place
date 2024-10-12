require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: {
    compilers: [
      {version: "0.8.27"}, {version: "0.8.0"} 
    ]
  },
  namedAccounts: {
    deployer: {
      default: 0
    }
  }
};
