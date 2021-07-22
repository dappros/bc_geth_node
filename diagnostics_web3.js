// Web 3 diagnostics utility 
// (c) Taras Filatov, Dappros Ltd, 26.04.2021

var Web3 = require('web3');
// var provider = 'http://3.129.190.111';
var provider = 'http://172.31.29.233';
var web3Provider = new Web3.providers.HttpProvider(provider);
var web3 = new Web3(web3Provider);

// get last block
web3.eth.getBlockNumber().then((result) => {
  console.log("Latest Ethereum Block is ",result);
});

// get accounts
web3.eth.personal.getAccounts().then((result) => {
  console.log("Accounts list: ",result);
});

// get a specific block
web3.eth.getBlockTransactionCount(17).then(console.log);
web3.eth.getBlock(17).then(console.log);
