#!/usr/bin/env bash

if [ $# -eq 0 ]; then
	input=($(cat))
else
	input=($@)
fi

if [ -z "$input" ]; then
	exit 1
fi

url="https://seeiendom.kartverket.no/api/bygningerForMatrikkelenhet$(printf '/%s' "${input[@]}")"

echo $(curl -s $url) | jq '.[] | select(.status | contains("riving"))'
