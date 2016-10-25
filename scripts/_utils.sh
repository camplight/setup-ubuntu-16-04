#!/usr/bin/env bash
set -eu -o pipefail

fail() {
    # generic fail function for bash scripts
    # arg: 1 - custom error message
    # arg: 2 - file
    # arg: 3 - line number
    # arg: 4 - exit status
    echo "ERROR: ${1}" >&2
    [[ ${2+defined} && ${3+defined} && ${4+defined} ]] && \
    echo "file: ${2}, line number: ${3}, exit code: ${4}. exiting!"

    # generic clean up code goes here (tempfiles, forked processes,..)

    exit 1
}

