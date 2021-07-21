#!/bin/bash
# Geth private blockchain bootnode starter script (c) Taras Filatov, Dappros Ltd, 21.07.2021
# This restarts bootnode service automatically to help nodes discover each other
#
# First time launch on a new node (to generate your enode address key):
# bootnode -genkey bootnode.key
#
# All consequent launches - recommended start routine:
# (1) Enter 'screen';
# (2) Execute 'sh bootnode_starter.sh | tee -a >> bootnode_starter.screen.log';
# (3) Press 'Ctrl+a' and then 'd' to detach from screen session
# You can always re-attach screen session via 'screen-r' or you can check logs

while ! bootnode -nodekey bootnode.key -verbosity 9 -addr :30310
do
  sleep 1
  echo "Restarting bootnode service following some termination.."
  echo $(date -u) "Bootnode service restarted following some termination.." >> bootnode_starter.sh.log
done
