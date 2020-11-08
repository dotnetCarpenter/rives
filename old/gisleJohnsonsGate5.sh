#!/usr/bin/env bash

# Gisle Johnsons gate 5
# curl -s https://seeiendom.kartverket.no/api/bygningerForMatrikkelenhet/276012203 | jq '.[] | .status != "Tatt i bruk"'

# Anders Buens gate 7A
curl -s https://seeiendom.kartverket.no/api/bygningerForMatrikkelenhet/276012045
