#!/bin/bash

echo
echo "==> Start"

if [ ! -z "${BASH_SCRIPT_WORKING_DIR}" ] ; then
	echo "==> Switching to working directory: ${BASH_SCRIPT_WORKING_DIR}"
	cd "${BASH_SCRIPT_WORKING_DIR}"
	if [ $? -ne 0 ] ; then
		echo " [!] Failed to switch to working directory: ${BASH_SCRIPT_WORKING_DIR}"
		exit 1
	fi
fi

echo
echo "==> $ bash $__INPUT_FILE__"
echo
bash "$__INPUT_FILE__"
script_result=$?

echo
echo "==> Script finished with exit code: ${script_result}"
exit ${script_result}
