#!/usr/bin/env bash

############################
# Depends on curl and jq   #
############################

function uriencode () {
	local i="$@"
	jq --null-input --raw-output --arg value "$i" '$value|@uri';
}

address=$(uriencode $@)

echo "Søker på \"$@\"..."
echo

result=$(curl -s -H "accept: application/json" \
	"https://ws.geonorge.no/adresser/v1/sok?treffPerSide=10&side=0&asciiKompatibel=false&sok=$address")

noOfAddresses=$(echo $result | jq '.adresser | length')
# declare -a adresses=$(echo $result | jq .adresser)
# adresses=$(echo $result | jq --raw-output '.adresser | @sh')
# echo ${#adresses[@]}

if [ $noOfAddresses -eq 0 ]; then
	echo "Intet fundet"
else
	echo $result | jq .adresser
fi
