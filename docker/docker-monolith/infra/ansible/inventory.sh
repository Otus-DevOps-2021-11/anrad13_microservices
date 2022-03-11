#!/bin/bash

cd ../terraform/stage

case "$1" in
--list) terraform output -json | python3 inventory.py  ;;
--host) echo "{}" ;;
esac
