### Plan (to Sync/Export Prod to Dev blockchain nodes)

1. Login to Prod b/c node N1
2. Export b/c data via “geth export”
3. Archive keystore directory
4. Stop all Dev b/c nodes
5. Login to Dev b/c node N1
6. Import b/c data via “geth import”
7. Replace dev keystore directory with keystore directory from Prod b/c node N1 archive
8. Restart QA/Dev b/c node N1
9. Restart other QA/Dev b/c nodes



// echo "log$(date +'\%m\%d\%y')"

## Export chaindata and keys

ps aux | grep geth

kill [PID] // use process ID obtained from the above (in our experiments "kill -9 [PID]" also results in a graceful stop but is not necessary, since usual "kill" also works for geth process)

ps aux | grep geth

#### check that geth is not running. If it's running you might want to "pkill screen" and repeat the above step.

geth --datadir data export backups/p01chain$(date +%y%m%d)

#### NOTE: if running from Cron, you might need to escape characters like this "geth --datadir data export backups/p01chain$(date +'\%y\%m\%d')"

#### restart the Geth process 
(launch screen and then launch "sh starter.sh" then Ctrl+A and "d" to detach) 

#### compress the chaindata (up to x5 compression in our experiments)

tar -czvf backups/p01chain$(date +%y%m%d).gz backups/p01chain$(date +%y%m%d) 

#### (optional) remove uncompressed chaindata file

rm backups/p01chain$(date +%y%m%d)

#### archive and compress the accounts/keys data from keystore directory

tar -czvf backups/p01keys$(date +%y%m%d).gz data/keystore

#### copy chaindata and keydata to remote host (your QA node, for example)

scp -i mykey.pem backups/p01chain$(date +%y%m%d).gz ubuntu@my.ec2.id.amazonaws.com:/backupsImport/


## Import chaindata and keys

#### Stop all b/c nodes in the network where you're importing the chain 

ps aux | grep geth

kill [PID]

ps aux | grep geth

#### if the above still returns a new running geth process, then kill screen utility to stop it from restarting it:

pkill screen

#### remove chaindata (answer "y" to all questions)

geth --datadir data removedb

#### remove keystore data 

rm data/keystore/*.*

#### uncompress the chaindata file to be imported (update with your correct filenames)

tar -xvzf backupsImport/p01chain210805.gz -C backupsImport

geth --datadir data import backupsImport/backups/p01chain210805

#### check that keystore directory is empty in the target node

ls data/keystore

#### uncompress the keystore data  (update with your correct filenames)

tar -xvzf backupsImport/p01keys210805.gz -C .

#### init your target b/c nodes with your correct genesis file

geth --datadir data init dppprod.json

#### import chaindata file (takes 5 minutes for a 300Mb file with 500k blocks) 

geth --datadir data import backupsImport/backups/p01chain210805

#### delete uncompressed chaindata file

rm backupsImport/backups/p01chain210805










