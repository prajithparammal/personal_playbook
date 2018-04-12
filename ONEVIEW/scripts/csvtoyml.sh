#!/bin/bash
cd ansible/ONEVIEW/
OUTPUT="files/output.yml"
echo "---" > $OUTPUT; 
echo "ETH_NW:" >> $OUTPUT
x=1
sed -i "/^#/d" input.csv
INPUT=input.csv
OLDIFS=$IFS
y=$(wc -l input.csv  | cut -d " " -f1)
while [ $x -le $y ]
do
IFS=,
[ ! -f $INPUT ] && { echo "$INPUT file not found"; exit 99; }
while read -r network_name vlan network_set
do
   echo " NW$x:"  >> $OUTPUT
   echo "    network_name: $network_name" >> $OUTPUT
   echo "    vlan: $vlan" >> $OUTPUT
   echo "    network_set: $network_set" >> $OUTPUT
   x=$(($x + 1))
done < $INPUT
done
echo "#network_name,vlan,network_set" > $INPUT
echo "#Eg: P1MSVmgmtvM,2000,Data_NetworkSet_A"  >> $INPUT
echo "P1MSVmgmtvM,2000,Data_NetworkSet_A"  >> $INPUT
