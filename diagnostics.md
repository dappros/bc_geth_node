## SYSTEM

### Syslog

Check /var/log/syslog around the specific time for detailed information in case of system failure

## GETH CONSOLE

### Attach console

sudo geth attach ~/data/geth.ipc

### Check connected peers
admin.peers.forEach(function(value){console.log(value.network.remoteAddress+"\t"+value.name)})

admin.peers is similar to above, but returns more verbose output

### Check latest block info
eth.getBlockNumber("latest")

### Check misc node info (including enode address etc)
admin.nodeInfo

### Add another peer manually
admin.addPeer("put enode address here")

## KILL GETH PROCESS

pkill screen

ps aux | grep geth

kill [PID] // use process ID obtained from the above (in our experiments "kill -9 [PID]" also results in a graceful stop but is not necessary, since usual "kill" also works for geth process)

## CHECK PENDING TRANSACTIONS

eth.pendingTransactions

## CHECK ACCOUNTS/WALLETS

Get the number of accounts/wallets in the keystore directory of the node

cd /data/keystore

find . -type f | wc -l

## EMULATE OOM

Node overload due to out of memory (OOM) can cause the loss of blocks as Geth node stores many latest blocks in memory especially on private chains where block size is very small.
OOM may be caused by intenstive load over the node RPC, for example, even if otherwise it may be not overloaded. OOM kills geth service resulting in loss of blocks stored in the memory. To test such scenario and verify whether the system can recover blocks from other nodes we emulate the OOM using this command: 

tail /dev/zero

## CLEAN CHAINDATA 

geth --datadir data removedb

geth --datadir data init dppprod.json

(replace dppprod.json with your genesis file)

