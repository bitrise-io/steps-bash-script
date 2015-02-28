#!/bin/bash

set -e

if [ ! -z "${BASH_SCRIPT_WORKING_DIR}" ] ; then
	echo "Switching to working directory: ${BASH_SCRIPT_WORKING_DIR}"
	cd "${BASH_SCRIPT_WORKING_DIR}"
fi

echo "$ bash $__INPUT_FILE__"
set +e
bash "$__INPUT_FILE__"
exit $?