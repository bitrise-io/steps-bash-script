#!/bin/bash

THIS_SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

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

set -e

CONFIG_tmp_script_file_path="${THIS_SCRIPT_DIR}/._script_cont"

if [ ! -z "${content}" ] ; then
	# if content is defined use it
	printf "${content}" > "${CONFIG_tmp_script_file_path}"
else
	# for compatibility
	#  __INPUT_FILE__ can either be a file path
	#  or the content of the script
	if [ -f "${__INPUT_FILE__}" ] ; then
		# it's a file path - move it to the required path, to run
		cp "${__INPUT_FILE__}" "${CONFIG_tmp_script_file_path}"
	else
		# not a file path, it's the full content
		if [ -z "${__INPUT_FILE__}" ] ; then
			echo " [!] No input / content specified!"
			exit 1
		fi
		printf "${__INPUT_FILE__}" > "${CONFIG_tmp_script_file_path}"
	fi
fi

set +e

echo
echo "==> $ bash ${CONFIG_tmp_script_file_path}"
echo
bash "${CONFIG_tmp_script_file_path}"
script_result=$?
rm "${CONFIG_tmp_script_file_path}"

echo
echo "==> Script finished with exit code: ${script_result}"
exit ${script_result}
