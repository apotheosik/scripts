#!/bin/bash

echo timestamp and timezone
date
echo
echo uptime
uptime
echo
echo system information 
uname -a
echo
echo cpu architecture
head -5 /proc/cpuinfo
echo
echo free and used memory
free
echo
echo storage information on all drives
df -h
echo
echo storage on primary drive 
df -h /
echo
echo partitions
cat /proc/partitions
echo
echo hostname, domainname 
hostname && domainname
echo
echo all interfaces mac addresses
ip maddress | head -5
echo
echo all interfaces logical addresses
ip address | grep inet
echo
echo network interfaces by promiscuity
ip a show | grep -i promisc
echo
echo current network connections
netstat -at
echo
echo currently logged in users
who
echo
echo list of all users
cut -d: -f1 /etc/passwd | head -5 
echo
echo users with root or UID is 0
grep 'x:0:' /etc/passwd
echo
echo root SUID files
find /-uid 0 -perm -4000 2>/dev/null
#or find / -perm -04000
echo
echo processes
ps -au | awk '{print $11}'
echo
echo files opened by netcat
lsof | awk '{print $1, $NF}' | grep -E "^nc"
echo
echo open unlinked files 
lsof +L1
echo
echo file modded in 24hrs
find -mtime 0	| head -5
echo
echo root scheduled tasks
sudo crontab -u root -l
echo
echo cas8903defined network connections by application
lsof -i | awk '{print $1, $NF}'
echo
echo cas8903defined show arp table
arp -a
echo
echo cas8903defined show passwd, shadow file
sudo head -5 /etc/shadow && sudo head -5 /etc/passwd
#these are considered volatile bc if you cannot get sudo other than if you are sitting in front of the computer 

