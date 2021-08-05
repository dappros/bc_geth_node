## SYSTEM

### Syslog

Check /var/log/syslog around the specific time for detailed information in case of system failure

## GETH CONSOLE

### Check connected peers
admin.peers.forEach(function(value){console.log(value.network.remoteAddress+"\t"+value.name)})

## KILL GETH PROCESS

pkill screen

ps aux | grep geth

kill [PID] // use process ID obtained from the above (in our experiments "kill -9 [PID]" also results in a graceful stop but is not necessary, since usual "kill" also works for geth process)

## CHECK ACCOUNTS/WALLETS

Get the number of accounts/wallets in the keystore directory of the node

cd /data/keystore

find . -type f | wc -l



