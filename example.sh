#!/usr/bin/env bash

[[ -z $@ ]] && address="Anders Buens gate" || address=$@

./address.sh $address | parallel ./matrikkelenhetID.sh | parallel ./status.sh
