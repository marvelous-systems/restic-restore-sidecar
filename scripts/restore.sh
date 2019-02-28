#!/bin/sh
echo "Starting restore..."
for hash in $(echo $RESTORE_SNAPSHOTS | sed "s/,/ /g")
do
	./restic \
		-r "sftp::${SFTP_PATH}" \
		-o sftp.command="ssh ${SFTP_USER}@${SFTP_HOST} -p ${SFTP_PORT} -o StrictHostKeyChecking=no -i /ssh/key -s sftp" \
		--verbose \
		restore "$hash" \
		--target /
done
