### Bootnode

Bootnode is a stripped down Geth service that aids in p2p discovery of geth nodes in the network.
After restart, your geth nodes get a new enode address.
If you specify that enode in the start scripts of other nodes of your network, nodes might lose each other if they get restarted, due to changes in enode addresses.
Bootnode retains a consistent enode key and helps in discovery and diagnostics of ping-pong activity between the nodes in your network.

#### First time start
bootnode -genkey bootnode.key

#### For repeated starts (this also ensures that it uses the same enode key)
bootnode -nodekey boot.key -verbosity 9 -addr :30310
