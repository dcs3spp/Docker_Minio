FROM alpine:latest

#
# Overview
# - Starts a minio server on port 9000 and creates an S3 storage bucket
# - The bucket name and login credentials are configurable using environment
#   variables.
# - supervisor is used to start the minio server and then spawn a shell script
#   to create the s3 storage bucket.
#
# Expected environment
# - BUCKET              : Name of the S3 storage bucket
# - MINIO_ACCESS_KEY    : Login key
# - MINIO_SECRET_KEY    : Login password
#
# Provided software:
# - mc
# - minio
# - supervisor
#
# Users:
# - user:staff          : user has sudo privileges
#

COPY ./minio-init /usr/local/bin/
COPY ./supervisor-app.conf /etc/supervisor/conf.d/

RUN apk update \
  && apk upgrade \
  && apk add --no-cache sudo supervisor wget \
  && addgroup staff \
  && adduser -S user -G staff \
  && echo "user ALL=(ALL) NOPASSWD:ALL" >>/etc/sudoers \
  && chmod +x /usr/local/bin/minio-init \
  && wget https://dl.minio.io/server/minio/release/linux-amd64/minio \
  && chmod +x minio \
  && wget https://dl.minio.io/client/mc/release/linux-amd64/mc \
  && chmod +x mc \
  && mv minio /usr/local/bin \
  && mv mc /usr/local/bin

USER user

CMD ["sudo", "-E", "supervisord", "-n", "-c", "/etc/supervisor/conf.d/supervisor-app.conf"]
