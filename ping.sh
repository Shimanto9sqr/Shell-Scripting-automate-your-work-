#!/bin/bash

echo "Hello from Main Branch"

if ping -c 3 $1 &>/dev/null;
then
	echo "PING SUCCESS"
else
	echo "PING Failed"
fi

IP=$(nslookup $1)
echo "$IP"


