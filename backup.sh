#!/bin/bash

gcloud auth activate-service-account --key-file=/backup/auth_key.json
gsutil -m cp -R "$SOURCE_GS_BUCKET" "$TARGET_GS_BUCKET/$(date "+%Y%m%d-%H%M%S")"
