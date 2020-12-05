#!/bin/sh
sed -e "s/%PORT%/$PORT/g" ./static/vault.bak.json > ./static/vault.json
dotnet Dummy.Web.dll
