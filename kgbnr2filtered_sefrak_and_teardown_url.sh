#!/bin/sh
check() {
        CADASTREID=`curl -s "https://seeiendom.kartverket.no/api/matrikkelenhet/$1/$2/$3" | jq .matrikkelenhetId`
        STATUS=`curl -s "https://seeiendom.kartverket.no/api/bygningerForMatrikkelenhet/$CADASTREID"`
        SEFRAK_AND_TEARDOWN=`echo $STATUS | jq '.[] | .sefrak == true and (.status | contains("riving"))' || echo "false"`
        echo $SEFRAK_AND_TEARDOWN | grep -q true && echo "https://seeiendom.kartverket.no/eiendom/$1/$2/$3/0/0"
}

check $1 $2 $3
