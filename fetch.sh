#!/bin/sh
PATH=/usr/bin
wget -qO root.zone http://www.internic.net/domain/root.zone
#git diff-index --quiet HEAD -- root.zone
git diff --quiet HEAD -- root.zone
if [ $? -eq 1 ]
then
	git add root.zone 
	git commit -a -m'add new copy of root zone'
	git push
fi
