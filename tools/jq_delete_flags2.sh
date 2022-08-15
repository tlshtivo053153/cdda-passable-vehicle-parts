#!/bin/bash

FLAG_NAMES="$1"
FILENAME="$2"

JQ_COMMAND=`printf 'map(. | { "copy-from": .id, id: .id, name: .name, type: .type, looks_like: .looks_like, delete: { flags: %s } })' "$FLAG_NAMES"`

cat "$FILENAME" | jq "$JQ_COMMAND" | json_formatter.cgi | sponge "$FILENAME"
