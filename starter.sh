#!/bin/bash
# Geth private blockchain node starter script (c) Taras Filatov, Dappros Ltd, 21.07.2021
# This script restarts Geth automatically upon shutdown of Geth service (we found it handy after service get killed upon RPC-caused failure during load testing etc)
#
# Recommended start routine:
# (1) Enter 'screen';
# (2) Execute 'sh starter.sh | tee -a >> starter.screen.log';
# (3) Press 'Ctrl+a' and then 'd' to detach from screen session
# You can always re-attach screen session via 'screen-r' or you can check logs

intIP = '<specify your internal IP address here>' # this is 'internal IP' of your instance used in RPC, WS config and for communication between nodes
extIP = '<specify your external IP address here>' # this is external IP address of your instance

while ! geth --datadir data/data --rpc --rpcport "8545" --rpcaddr "$intIP" --rpccorsdomain "*" --ws --ws.origins "*" --ws.addr "$intIP" --ws.port "8546" --rpcapi "web3,>
do
  sleep 1
  echo "Restarting geth following some termination.."
  echo $(date -u) "Geth restarted following some termination.." >> starter.sh.log
done
