#!/bin/bash

set -e

SCRIPT_DIR="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"

help="
clpeak post_update depends on 'ninja-to-soong' (https://github.com/rjodinchr/ninja-to-soong).
Please set 'N2S_DIR' to 'ninja-to-soong' to run this script.

Example:
$ N2S_DIR=<path/to/ninja-to-soong> ./tools/external_updater update external/clpeak
"
[[ -z "${N2S_DIR}" ]] && echo "$help" && exit -1

pushd "${N2S_DIR}"
cargo run --release -- --aosp-path $(realpath "${SCRIPT_DIR}/../..") clpeak --copy-to-aosp
popd
