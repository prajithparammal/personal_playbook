#!/bin/bash
cd  ../files/
for i in `ls --file-type | grep -v @ | grep -v / | grep -v .tgz`; do yes | cp -f  $i etc/vmware/weasel/ ; tar -cf $i.tgz etc ; done
