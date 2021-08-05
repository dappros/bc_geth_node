## SYSTEM

### Syslog

Check /var/log/syslog around the specific time for detailed information in case of system failure

## GETH CONSOLE

### Check connected peers
admin.peers.forEach(function(value){console.log(value.network.remoteAddress+"\t"+value.name)})

## KILL GETH PROCESS

pkill screen

ps aux | grep geth

kill -9 [PID]  // use process ID obtained from the above
