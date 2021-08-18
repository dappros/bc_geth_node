### Bootnode

Bootnode is a stripped down Geth service that aids in p2p discovery of geth nodes in the network.
After restart, your geth nodes get a new enode address.
If you specify that enode in the start scripts of other nodes of your network, nodes might lose each other if they get restarted, due to changes in enode addresses.
Bootnode retains a consistent enode key and helps in discovery and diagnostics of ping-pong activity between the nodes in your network.

#### First time start
bootnode -genkey bootnode.key

#### For repeated starts (this also ensures that it uses the same enode key)
bootnode -nodekey boot.key -verbosity 9 -addr :30310

### Enode

Enode boot key should be specified correctly. 
Note that bootnode key is 64 bytes but enode address is 128 bytes:

use

admin.nodeInfo

to get your enode URL


#### Example in our Q01 node:

##### In bootnode.key file:
ubuntu@ip-172-31-21-176:~$ cat bootnode.key
dfbbf0e251b7d88295961ec7ac3f46016c1bf938fbe6e9ccade6f328a9bc07cb

##### In starter.sh for all boot nodes in the network:
GETHBOOTNODE1=enode://1fd3fba1b026e11be2a4ce959cdd9c75d6b18c51a4adcf34619818527ecbd4f0389ede94fc5ac57b6e94e91a972f6822ee5d292199a90d7d335842c61602af20@3.129.190.111:30303

##### In geth console on startup:
self=enode://1fd3fba1b026e11be2a4ce959cdd9c75d6b18c51a4adcf3461981852de94fc5ac57b6e94e91a972f6822ee5d292199a90d7d335842c61602af20@3.129.190.111:30303
