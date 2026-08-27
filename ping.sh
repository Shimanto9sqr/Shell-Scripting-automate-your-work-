#!/bin/bash

echo "Hello from Conflict Branch"
echo "Not Staged"
echo "Nor Commited"
if ping -c 3 $1 &>/dev/null;
then
	echo "PING SUCCESS"
else
	echo "PING Failed"
fi

IP=$(nslookup $1)
echo "$IP"


