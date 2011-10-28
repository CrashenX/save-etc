#!/bin/bash

for i in `git --git-dir=/etc/.git/ --work-tree=/etc/ ls-files -o -x *~`; do git --git-dir=/etc/.git --work-tree=/etc/ add $i; done
git --git-dir=/etc/.git --work-tree=/etc/ commit -m "Daily cron: Added new files"

for i in `git --git-dir=/etc/.git/ --work-tree=/etc/ ls-files -m`; do git --git-dir=/etc/.git --work-tree=/etc/ add $i; done
git --git-dir=/etc/.git --work-tree=/etc/ commit -m "Daily cron: Updated modified files"

for i in `git --git-dir=/etc/.git/ --work-tree=/etc/ ls-files -d`; do git --git-dir=/etc/.git --work-tree=/etc/ rm $i; done
git --git-dir=/etc/.git --work-tree=/etc/ commit -m "Daily cron: Removed deleted files"

exit 0
