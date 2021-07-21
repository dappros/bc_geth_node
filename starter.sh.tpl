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

# ARCHIVE MODE
# add the following in the end of the geth parameters if you want to run this node in Archive mode: ' --gcmode=archive'


while ! geth --datadir data --http --http.port "8545" --http.addr $GETHINTIP --http.corsdomain "*" --ws --ws.origins "*" --ws.addr $GETHINTIP --ws.port "8546" --http.api ">
do
  sleep 1
  echo "Restarting geth following some termination.."
  echo $(date -u) "Geth restarted following some termination.." >> starter.sh.log
done
