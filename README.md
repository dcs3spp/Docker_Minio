# README

## Overview
- Starts a minio server on port 9000 and creates an S3 storage bucket
- The bucket name and login credentials are configurable using environment
  variables.
- supervisor is used to start the minio server and then spawn a shell script
  to create the s3 storage bucket.

## Expected environment
- MINIO_BUCKET        : Name of the S3 storage bucket
- MINIO_ACCESS_KEY    : Login key
- MINIO_SECRET_KEY    : Login password

## Software:
- mc: Release 2020-10-03T02-54-56Z
- minio: Release 2020-10-03T02-19-42Z
- supervisor

## Users:
- user:staff          : user has sudo privileges
