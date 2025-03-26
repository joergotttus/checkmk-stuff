#!/bin/bash
ufw 1> /dev/null 2>& 1
if [ $? -eq 127 ];then
echo "1 \"Local_UFW State\" - WARNING - UFW is not installed"
exit 1
fi

status=$(ufw status verbose | grep "Status:" | cut -d ":" -f 2 | cut -d " " -f2)
logging=$(ufw status verbose | grep "Logging:" | cut -d ":" -f 2 | cut -d " " -f2)
default=$(ufw status verbose | grep "Default:" | cut -d ":" -f 2)
count=$(ufw status numbered | tail -n +5 | wc -l)
count2=$((count-1))


if [ $status = inactive ] || [ $status = Inaktiv ];then
echo "1 \"Local_UFW State\" - WARNING - UFW is inactive"
exit 1
fi
if [ $status = active -a $count -ne 0 ];then
echo "0 \"Local_UFW State\" - UFW is active with $count2 rules, Logging is $logging, Default is$default"
exit 0
else
echo "2 \"Local_UFW State\" - ALERT - UFW is active with no rule defined"
fi
