#!/bin/bash
#
# Convenience script for running ansible witihn a venv and with mitogen.
#
# Usage:
#   ./sync.sh docker.yml

set -e

cd "$(dirname "$0")"

# TODO(joey): Conditionally create and install .venv

# Some Ansible task was breaking on MacOS due to some ObjC fork errors, and this
# fixes it.
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# Load ansible venv.
source .venv/bin/activate
# Load mitogen which drastically speeds up the run.
export ANSIBLE_STRATEGY_PLUGINS=".venv/lib/python3.12/site-packages/ansible_mitogen/plugins/strategy"
ansible-playbook "$@"