#!/bin/sh
PATH=/usr/bin
wget http://www.internic.net/domain/root.zone
git diff-index --quiet HEAD -- || git add --quite root.zone && git commit --quite  -m'add new copy of root zone' && git push --quite
