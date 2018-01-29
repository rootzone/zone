#!/bin/sh
PATH=/usr/bin
wget -qO root.zone http://www.internic.net/domain/root.zone
git diff-index --quiet HEAD root.zone
if [ $? -eq 1 ]
then
	git add root.zone 
	git commit -m'add new copy of root zone' root.zone
	git push
fi
