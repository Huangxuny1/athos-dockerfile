#!/bin/bash

set -e

# Write myid only if it doesn't exist
if [[ ! -f "$ZK_DATA_DIR/myid" ]]; then
    echo "${ZK_MY_ID:-1}" > "$ZK_DATA_DIR/myid"
fi

exec "$@"