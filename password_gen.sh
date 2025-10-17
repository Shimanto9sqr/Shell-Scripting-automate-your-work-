#!/bin/bash

#base64 password generator

echo "Base64 Password generator"
sleep 2

echo "Enter Password length:"
read PASS_LENGTH

for p in $(seq 1 5);
do
	openssl rand -base64 48 | cut -c1-$PASS_LENGTH
done
