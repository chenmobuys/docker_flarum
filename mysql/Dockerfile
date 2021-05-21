ARG MYSQL_VERSION
ARG MYSQL_USERNAME
ARG MYSQL_PASSWORD
ARG MYSQL_DATABASE
FROM mysql:$MYSQL_VERSION

# 初始化数据库脚本
COPY scripts/*.sql /docker-entrypoint-initdb.d

USER www-data:www-data

