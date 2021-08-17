const Web3 = require("web3");
// const provider = new Web3.providers.WebsocketProvider('ws://18.119.81.161:8546');
const provider = new Web3.providers.WebsocketProvider('ws://3.129.190.111:8546');
let web3 = new Web3(provider);
const main = async () => {
    let blockNumber = await web3.eth.getBlockNumber();
    console.log('blockNumber = ', blockNumber)
}
main();
