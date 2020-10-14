#!/bin/sh
# Replace broadstairsfolkweek.org.uk in SQL files with localhost

# This script is expected to be sourced, therefore test path against arg $1 rather than $0.
SCRIPT=$(readlink -f "$1")
# If nothing found in $1 then fall back to $0.
if [ -z "$SCRIPT" ]; then
  SCRIPT=$(readlink -f "$0")
fi
SCRIPTPATH=$(dirname "$SCRIPT")

echo "SCRIPT: $SCRIPT"
echo "SCRIPTPATH: $SCRIPTPATH"

for x in $SCRIPTPATH/*.sql; do
    [ -e "$x" ] || continue
    echo "Processing SQL file: $x"
    sed -i 's#https://broadstairsfolkweek.org.uk#http://localhost#g' "$x"
done