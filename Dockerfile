FROM vault:1.6.0
COPY . /vault/config
ENTRYPOINT ["sh /vault/config/docker-entrypoint.sh"]
