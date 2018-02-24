#!/usr/bin/env bash
set -e

trap "echo 'Stopping...'; exit" SIGINT SIGTERM

echo "Starting..."

INTERVAL=$1
COUNTER=0
while true; do
	if (( COUNTER == $INTERVAL )); then
		COUNTER=0
		# Run something every $INTERVAL seconds
		python3.6 main.py
	fi
	COUNTER=$[COUNTER + 1]

	sleep 1
done