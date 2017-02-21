#!/bin/bash

# halt on any error (non-0 exit code)
set -e

# halt when referencing any unbound variable
set -u


out() { printf %s\\n "$*" ; }
err() { >&2 printf %s\\n "$*" ; }
die() { >&2 printf %s\\n "$*" ; exit 1 ; }

display_help () {
  cat <<EOM
Usage: install.sh [OPTIONS]

Options:

  -d, --directory   specify install directory (defaults to /usr/local/bin)
  -f, --force       install over a current install of num
  -h, --help        display this help message
EOM
}

install () {
  if [[ ! "$(force_install?)" ]] && [[ -e "$(dst_file)" ]]; then
    err "file already exists: ""$(dst_file)"
  fi

  local src_file="$(dirname "${0}")"/num

  if ! cp "${src_file}" "$(dst_file)"; then
    err "Unable to copy '${src_file}' to '$(dst_file)'"
  fi
}

dst_file () {
  local dst_dir="${NUM_INSTALL_DIR:-/usr/local/bin}"
  mkdir -p "${dst_dir}"
  out "${NUM_INSTALL_DIR:-/usr/local/bin}"/num
}

force_install? () {
  echo "${NUM_FORCE_INSTALL:-""}"
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
        die "invalid option: ""${1}"
        ;;
    esac

    parse_args $@
  fi
}

# parse command line options
parse_args $@

# install num
install
