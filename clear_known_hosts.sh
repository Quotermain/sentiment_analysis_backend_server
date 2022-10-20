#!/usr/bin/bash
known_hosts=("quoterback.ru" "192.168.10.21")
for host in ${known_hosts[@]}
do
	ssh-keygen -f "/var/lib/jenkins/.ssh/known_hosts" -R $host
done

ssh-keyscan -H quoterback.ru >> "/var/lib/jenkins/.ssh/known_hosts"
ssh quoterback.ru ssh-keyscan -H 192.168.10.21 >> "/var/lib/jenkins/.ssh/known_hosts"
