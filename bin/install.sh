#!/bin/bash

# halt on any error (non-0 exit code)
set -e

# halt when referencing any unbound variable
set -u

display_help () {
  cat <<EOM
Usage: install.sh [OPTIONS]

Options:

  -d, --directory   specify install directory (defaults to /usr/local/bin)
  -f, --force       install over a current install of num
  -h, --help        display this help message
EOM
}

parse_args () {
  if [[ $@ ]]; then
    case "${1}" in
      -d|--directory)
        shift
        NUM_INSTALL_DIR="${1}"
        shift
        ;;
      -f|--force)
        shift
        NUM_FORCE_INSTALL=true
        ;;
      -h|--help)
        display_help
        exit 0
        ;;
      *)
        echo "invalid option: "${1} >&2
        exit 1
        ;;
    esac

    parse_args $@
  fi
}

# parse command line options
parse_args $@

# TODO:  implement installer
