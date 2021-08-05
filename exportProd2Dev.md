### Sync/Export Prod to Dev blockchain nodes

1. Login to Prod b/c node N1
2. Export b/c data via “geth export”
3. Archive keystore directory
4. Stop all Dev b/c nodes
5. Login to Dev b/c node N1
6. Import b/c data via “geth import”
7. Replace dev keystore directory with keystore directory from Prod b/c node N1 archive
8. Restart QA/Dev b/c node N1
9. Restart other QA/Dev b/c nodes
