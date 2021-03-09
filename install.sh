#!/bin/sh

set -e
set -u

./preinstall.sh && ansible-playbook setup.yml -i inventory --ask-become-pass
