#!/usr/bin/env bash

# curl -X GET "https://ws.geonorge.no/adresser/v1/sok?sok=Anders%20Buens%20gate%207A&treffPerSide=10&side=0&asciiKompatibel=false" -H "accept: application/json"
curl -s "https://ws.geonorge.no/adresser/v1/sok?sok=Anders%20Buens%20gate%207A&treffPerSide=10&side=0&asciiKompatibel=false" | jq
