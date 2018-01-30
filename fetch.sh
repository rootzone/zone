#!/bin/sh
PATH=/usr/bin
cd "$(dirname "$0")"
#wget -qO root.zone http://www.internic.net/domain/root.zone
dig AXFR . @xfr.dns.icann.org | awk '$4!="RRSIG" && $1!=";;" {print}' > root.zone
#git diff-index --quiet HEAD -- root.zone
git diff --quiet HEAD -- root.zone
if [ $? -eq 1 ]
then
	git add root.zone 
	git commit -a -m'add new copy of root zone'
	git push
fi
