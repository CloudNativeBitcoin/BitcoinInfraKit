#!/bin/bash
set -eo pipefail

shutdown_gracefully(){

  echo "Container is shutting down, lets make sure bitcoind flushes the db."
  bitcoin-cli stop
  sleep 5
}
trap shutdown_gracefully SIGTERM SIGHUP SIGQUIT SIGINT

mkdir -p "${BITCOIN_DIR}" 
gen-bitcoind-conf.sh >~/.bitcoin/bitcoin.conf

$@ &
echo "Infinate loop"
while true
do
  tail -f /dev/null & wait ${!}
done