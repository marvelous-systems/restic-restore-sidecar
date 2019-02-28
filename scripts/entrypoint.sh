#!/bin/sh

echo "Hello, Restic!"

# No arguments supplied, run backup
if [ $# -eq 0 ]
then
	if [ ! -f /ssh/key ]
	then
		echo "No ssh key found, aborting."
		exit 10
	fi

	./check-repo.sh
	./restore.sh

	echo "Bye!"
	while :; do sleep 20; done
fi

# arguments were supplied, exec as shell command
exec "$@"