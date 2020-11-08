#!/usr/bin/env bash

if [ $# -eq 0 ]; then
	input=($(cat))
else
	input=($@)
fi

if [ -z "$input" ]; then
	exit 1
fi

# Gisle Johnsons gate 5
# curl -s "https://seeiendom.kartverket.no/api/matrikkelenhet/5001/411/179" | jq .matrikkelenhetId

# Anders Buens gate 7A
# curl -s "https://seeiendom.kartverket.no/api/matrikkelenhet/5001/411/146"

# echo ${#input[@]}
# exit

url="https://seeiendom.kartverket.no/api/matrikkelenhet$(printf '/%s' "${input[@]}")"

# echo $url

result=$(curl -s "$url")

echo $result | jq '.matrikkelenhetId'
