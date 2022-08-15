#!/bin/bash

FLAG_NAMES="$1"
FILENAME="$2"

JQ_COMMAND=`printf 'map(select(contains({flags:%s})))' "$FLAG_NAMES"`
cat "$FILENAME" | jq "$JQ_COMMAND" | json_formatter.cgi | sponge "$FILENAME"

