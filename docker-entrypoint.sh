#!/bin/sh
sed -i.bak "s/%PORT%/$PORT/g" /vault/config/vault.json
sed -i.bak "s/%DATABASE_URL%/$DATABASE_URL/g" /vault/config/vault.json
vault server -config=/vault/config/vault.json
