#!/bin/bash
cd /WORKPLACE/MSV_DEPLOY/files/
for i in `ls *.cfg`; do
rm -f KS.CFG etc/vmware/weasel/* /tmp/ESX/customks.tgz
cp -f $i KS.CFG; 
mv KS.CFG etc/vmware/weasel/ ; 
tar -cf customks.tgz etc; 
cp -f customks.tgz /tmp/ESX/
xorrisofs -relaxed-filenames -J -R -o $i.iso -b isolinux.bin -c boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table /tmp/ESX/ ; 
rm -f $i
rm -f customks.tgz
done
