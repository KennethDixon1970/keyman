#!/bin/bash
#
# Compiles the Language Modeling Layer for common use in predictive text and autocorrective applications.
# Designed for optimal compatibility with the Keyman Suite.
#

LMLAYER_OUTPUT=build
WORKER_OUTPUT=build/intermediate
NAKED_WORKER=$WORKER_OUTPUT/index.js
EMBEDDED_WORKER=$WORKER_OUTPUT/embedded_worker.js

# Build the worker and the main script.
build ( ) {
  # Build worker first; the main file depends on it.
  # Then wrap the worker; Then build the main file.

  build-worker && wrap-worker && build-main
}

# Builds the top-level JavaScript file (the second stage of compilation)
build-main () {
  npm run tsc -- -p ./tsconfig.json || fail "Could not build top-level JavaScript file."
}

# Builds the inner JavaScript worker (the first stage of compilation).
# This script must be wrapped.
build-worker () {
  if ! [ -d $WORKER_OUTPUT ]; then
    mkdir -p "$WORKER_OUTPUT" # Includes any base folders recursively.
  fi

  npm run tsc -- -p ./worker/tsconfig.json || fail "Could not build worker."
}

# A nice, extensible method for -clean operations.  Add to this as necessary.
clean ( ) {
  if [ -d $WORKER_OUTPUT ]; then
    rm -rf "$WORKER_OUTPUT" || fail "Failed to erase the prior build."
  fi
  
  if [ -d $LMLAYER_OUTPUT ]; then
    rm -rf "$LMLAYER_OUTPUT" || fail "Failed to erase the prior build."
  fi
}

display_usage ( ) {
  echo "Usage: $0 [-clean] [-test | -tdd]"
  echo "       $0 -help"
  echo
  echo "  -clean              to erase pre-existing build products before a re-build"
  echo "  -help               displays this screen and exits"
  echo "  -tdd                skips dependency updates, builds, then runs unit tests only"
  echo "  -test               runs unit and integration tests after building"
}

# Prints a nice, common error message.
fail ( ) {
  # TODO: source shellHelperFunctions.sh
  local ERROR_RED
  local NORMAL
  ERROR_RED="$(tput setaf 1)"
  NORMAL="$(tput sgr0)"
  FAILURE_MSG="$1"
  if [[ "$FAILURE_MSG" == "" ]]; then
    FAILURE_MSG="Unknown failure."
  fi
  echo "$0: ${ERROR_RED}$FAILURE_MSG${NORMAL}"
  exit 1
}

# Creates embedded_worker.js. Must be run after the worker is built for the
# first time
wrap-worker ( ) {
  echo "> wrap-worker-code LMLayerWorkerCode ${NAKED_WORKER} > ${EMBEDDED_WORKER}"
  wrap-worker-code LMLayerWorkerCode "${NAKED_WORKER}" > "${EMBEDDED_WORKER}"
}

# Wraps JavaScript code in a way that can be embedded in a worker.
# To get the inner source code, include the file generated by this function,
# then use name.toString() where `name` is the name passed into this
# function.
wrap-worker-code ( ) {
  name="$1"
  js="$2"
  echo "// Autogenerated code. Do not modify!"
  printf "function %s () {\n" "${name}"
  cat "${js}"
  printf "\n}\n"
}

################################ Main script ################################

run_tests=0
fetch_deps=1
unit_tests_only=0

# Process command-line arguments
while [[ $# -gt 0 ]] ; do
  key="$1"
  case $key in
    -clean)
      clean
      ;;
    -help|-h)
      display_usage
      exit
      ;;
    -test)
      run_tests=1
      ;;
    -tdd)
      run_tests=1
      fetch_deps=0
      unit_tests_only=1
      ;;
    *)
      echo "$0: invalid option: $key"
      display_usage
      exit -1
  esac
  shift # past the processed argument
done

# Check if Node.JS/npm is installed.
type npm >/dev/null ||\
    fail "Build environment setup error detected!  Please ensure Node.js is installed!"

if (( fetch_deps )); then
  echo "Dependencies check"
  npm install --no-optional
fi

build || fail "Compilation failed."
echo "Typescript compilation successful."

if (( run_tests )); then
  if (( unit_tests_only )); then
    npm run test -- -headless || fail "Unit tests failed"
  else
    npm test || fail "Tests failed"
  fi
fi
