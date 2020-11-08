#!/usr/bin/env bash

./address.sh Anders Buens gate | parallel ./matrikkelenhetID.sh | parallel ./status.sh
