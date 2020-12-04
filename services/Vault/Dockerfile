FROM vault:1.3.1
COPY ./config /vault/config
ENTRYPOINT vault server -config=/vault/config/vault.json
