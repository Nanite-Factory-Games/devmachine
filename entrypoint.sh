#!/bin/sh

hostname -i | awk '{print $1}'

exec "$@"