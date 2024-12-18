#!/usr/bin/env bash

sh "update.sh"

sudo nixos-rebuild switch --flake .#nixmann --show-trace