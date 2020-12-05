#!/bin/sh
sed -i.bak "s/%PORT%/$PORT/g" ./static/vault.json
dotnet Dummy.Web.dll
