#!/bin/bash
# Geth private blockchain node starter script (c) Taras Filatov, Dappros Ltd, 21.07.2021
# This script restarts Geth automatically upon shutdown of Geth service (we found it handy after service get killed upon RPC-caused failure during load testing etc)
#
# Recommended start routine:
# (1) Enter 'screen';
# (2) Execute 'sh starter.sh | tee -a >> starter.screen.log';
# (3) Press 'Ctrl+a' and then 'd' to detach from screen session
# You can always re-attach screen session via 'screen-r' or you can check logs

GETHINTIP=<specify your internal IP address here>
# this is the internal IP of your instance used in RPC, WS config and for communication between nodes
#export GETHINTIP

GETHEXTIP=<specify your external IP address here>
# this is the external IP address of your instance
#export GETHEXTIP

GETHNETID=<specify your network ID here>
# network ID for your blockchain network

GETHMAINWALLET=<specify your main wallet address here>
# main Ethereum wallet of this node - will be unlocked to sign the transactions using password in password.txt

GETHCACHESIZE=2048
# cache size for Geth node (beware of the known issue where a lot of blocks may be stored in RAM if cache is large, need to use a periodic graceful restart script as a workarou>

GETHBOOTNODE1=enode://d1dd3b3e1953d7741c3d115f3ce107c753579043bb2ef9a5353908066fdf106fb4ef283e88e6bec0798816a35ea9fe7721e3579d5d4246ca3d0f0f96d2f58a0a@172.31.29.142:0?discport=30310
GETHBOOTNODE2=enode://0a8fb2f8da8c2e5bcc661449663f4952fb9d23d1fa6c767ec405c2e67ea2e3a5a27a43240f72ab80ac839c869dce84d75df658ae8adf73c3f5d23387b8f3c70a@127.0.0.1:0?discport=30310
GETHBOOTNODE3=enode://b0b7a3cee3ed876efa3a19566a2b0b4fd2133e86cd84026d9708b0f0018e924cb582ff4d2007a777ebc485404683f5dc0c49849c51f2199962ac476733fc3ea9@127.0.0.1:0?discport=30310

# ARCHIVE MODE
# add the following in the end of the geth parameters if you want to run this node in Archive mode: ' --gcmode=archive'

while ! geth --datadir data --http --http.port "8545" --http.addr $GETHINTIP --http.corsdomain "*" --ws --ws.origins "*" --ws.addr $GETHINTIP --ws.port "8546" --http.api "web3,personal,eth,net" --ws.api personal,web3,eth,net --unlock $GETHMAINWALLET --password password.txt --cache $GETHCACHESIZE --allow-insecure-unlock console --networkid $GETHNETID --mine --nat extip:$GETHEXTIP --bootnodes $GETHBOOTNODE1 $GETHBOOTNODE2 $GETHBOOTNODE3 --syncmode=full --nodekey bootnode.key --port 30303
do
  sleep 1
  echo "Restarting geth following some termination.."
  echo $(date -u) "Geth restarted following some termination.." >> starter.sh.log
done
