const { network, run, ethers } = require('hardhat');

const LOCAL_BLOCKCHAIN = ['localhost', 'hardhat'];

const TOKEN_TOTAL_SUPPLY = ethers.parseEther("1000000", 18);

const verify = async (contractAddress, args) => {
    if(!LOCAL_BLOCKCHAIN.includes(network.name)) {
        console.log("Verifying contract...")
        try {
            await run("verify:verify", {
            address: contractAddress,
            constructorArguments: args,
            })
        } catch (e) {
            if (e.message.toLowerCase().includes("already verified")) {
            console.log("Already Verified!")
            } else {
            console.log(e)
            }
        }
    }
}

module.exports = {
    verify,
    LOCAL_BLOCKCHAIN,
    TOKEN_TOTAL_SUPPLY
}