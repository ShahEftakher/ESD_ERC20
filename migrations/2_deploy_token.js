const ESDToken = artifacts.require('ESDToken.sol');

module.exports = function (deployer, _network, accounts) {
  deployer.deploy(ESDToken, 20000, accounts[0], 1000000);
};
