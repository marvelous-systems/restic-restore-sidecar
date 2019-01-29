#!/bin/sh
echo "Starting restore..."
for path_and_hash in $(echo $RESTORE_PATHS | sed "s/,/ /g")
do
	path=$(echo "$path_and_hash" | cut -d':' -f1)
	snapshot_hash=$(echo "$path_and_hash" | cut -d':' -f2)
	./restic \
		-r "sftp::${SFTP_PATH}" \
		-o sftp.command="ssh ${SFTP_USER}@${SFTP_HOST} -p ${SFTP_PORT} -o StrictHostKeyChecking=no -i /restic/key -s sftp" \
		--verbose \
		restore "$snapshot_hash" \
		--target "$path"
done
