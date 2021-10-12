(Post accidental node deletion by one of the team members):

Steps to restore (node Q03 in this case):

1. Created instance image of Q02 (I should probably have used P03, that would make things easier).
2. Created new instance for Q03 
3. Attached Elastic IP formerly from Q03 to our new Q03
4. Created storage snapshot from Q02 (again, could have used P03). 
5. Created new volume from above snapshot in availability zone us-east-2b (check availability zone of the instance in its Networking tab)
6. Stopped the new Q03 instance.
7. Deattached root volume from new instance (noting its device name “/dev/sda1” in my case)
8. Attached snapshot volume (copied from Q02) as root volume to Q03 under /dev/sda1 name.
9. Started Q03.
10. Logged via SSH to Q03.
11. Updated starter.sh with correct external IP and internal IP (note internal IP has changed as it's a new EC2 instance).
12. Copied main signer account from node P03 (note it was under different name in keystore as it’s linked to date of creation I guess, but the public key is the same and it was the only file there).
13. Copied password from P03.
14. Started starter.sh in screen.

