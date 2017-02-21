#!/bin/bash

# halt on any error (non-0 exit code)
set -e

# halt when referencing any unbound variable
set -u


parse_args () {
  if [[ $@ ]]; then
    case "${1}" in
      *)
        echo "invalid option: "${1} >&2
        exit 1
        ;;
    esac
  fi
}

# parse command line options
parse_args $@

# TODO:  implement installer
