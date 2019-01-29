#!/bin/sh

echo "Hello, Restic!"

# No arguments supplied, run backup
if [ $# -eq 0 ]
then
	if [ ! -f /restic/key ]
	then
		echo "No ssh key found, aborting."
		exit 10
	fi

	./check-repo.sh
	./restore.sh
fi

# arguments were supplied, exec as shell command
exec "$@"