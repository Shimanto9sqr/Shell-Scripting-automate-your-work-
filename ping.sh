#!/bin/bash

if ping -c 3 google.com &>/dev/null;
then
	echo "PING SUCCESS"
else
	echo "PING Failed"
fi
