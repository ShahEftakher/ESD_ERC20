const ESDToken = artifacts.require('ESDToken.sol');

contract('ESDToken', (addresses) => {
  it('Should Work', async () => {
    const esdToken = await ESDToken.new(10000, addresses[0], 1000000);
    const balanceOfAdmin = await esdToken.balanceOf(addresses[0]);
    assert(balanceOfAdmin == 10000000000000000000000n);
  });
});
