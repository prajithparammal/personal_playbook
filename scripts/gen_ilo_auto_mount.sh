#!/bin/bash
cd /WORKPLACE/MSV_DEPLOY
for i in `ls /WORKPLACE/MSV_DEPLOY/roles/esxi/files/*.yml`; do
echo "- import_playbook: /WORKPLACE/MSV_DEPLOY/roles/esxi/files/$i.yml" >> playbook/ilo_auto_mount.yml
