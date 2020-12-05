FROM vault:1.3.1
COPY . /vault/config
ENTRYPOINT ["sh ./docker-entrypoint.sh"]
