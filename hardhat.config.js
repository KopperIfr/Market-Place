require("@nomicfoundation/hardhat-toolbox");
require("hardhat-deploy");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: {
    compilers: [
      {version: "0.8.0"}, {version: "0.8.27"}
    ]
  },
  namedAccounts: {
    deployer: 0
  }
};
