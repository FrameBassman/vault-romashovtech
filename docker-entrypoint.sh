#!/bin/sh

# First of all, replace all '/' symbols
DATABASE_URL_SED=$(echo $DATABASE_URL | sed 's/\//\\\//g')

# Next replace all placeholders
sed -i.bak "s/%PORT%/$PORT/g" /vault/config/vault.json
sed -i.bak "s/%DATABASE_URL%/$DATABASE_URL_SED/g" /vault/config/vault.json

# Let's log final config
cat /vault/config/vault.json

vault server -config=/vault/config/vault.json
