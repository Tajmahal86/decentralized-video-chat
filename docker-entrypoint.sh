#!/bin/bash
set -e

ENVFILE=/opt/zipcall/.env

if test -f "$ENVFILE"; then
    echo "$ENVFILE exist"
    exec "$@"
fi

if [ -z "$TWILIO_ACCOUNT_SID" ]
then
  touch $ENVFILE
  echo "$TWILIO_ACCOUNT_SID" >> $ENVFILE
fi

if [ -z "$LOCAL_AUTH_TOKEN" ]
then
  touch $ENVFILE
  echo "$LOCAL_AUTH_TOKEN" >> $ENVFILE
fi

exec "$@"