#!/bin/sh

set -e

./prepare

exec keep-ecdsa -config ./config.toml start
