#!/bin/sh
echo "Checking repository..."

./restic \
	-r "sftp::${SFTP_PATH}" \
	-o sftp.command="ssh ${SFTP_USER}@${SFTP_HOST} -p ${SFTP_PORT} -o StrictHostKeyChecking=no -i /ssh/key -s sftp" \
	check

ret=$?
if [[ $ret != 0 ]]
then
	# something went wrong, repo possibly doesn't exist
	echo "Check did not complete successfully, aborting..."
	exit 10
fi
