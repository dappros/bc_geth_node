
** Check connected peers **
admin.peers.forEach(function(value){console.log(value.network.remoteAddress+"\t"+value.name)})
