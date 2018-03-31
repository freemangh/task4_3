#!/bin/bash
# Mirantis Internship 2018
# Task 4.3
# Eugeniy Khvastunov
# Simple back-up script
if [ $# != 2 ] ; then
  echo "Script accept only 2 parametres, you enter $#"
  (>&2 echo "Script accept only 2 parametres, you enter $#")
  exit 1
else
	if (echo "$2" | grep -E -q "^?[0-9]+$"); then

		if [ -f "$1" ] || [  -d "$1" ] ; then
		#
		echo "OK"
		BCKPDIR="/tmp/backups"
		TARGET="$1"
		COUNT="$2"
		CURPATH="$(pwd)"
		SCRPATH="$(echo $0 | rev | cut -c 11- | rev)"
		OUTFILE=$CURPATH/$SCRPATH'task4_3.out'
		TMPFILE=$CURPATH/$SCRPATH'task4_3.tmp'
		FILEMASK="$(echo $1 | cut -c 2- | tr '/' '-')"
		FILENAME="$FILEMASK-$(date +%F_%H-%M-%S_%N).tar.gz"
                if [ ! -d "$BCKPDIR" ] ; then
                        /bin/mkdir -p $BCKPDIR
                fi
		/bin/tar -czvf "$BCKPDIR/$FILENAME" "$TARGET" && ls -tp $BCKPDIR/$FILEMASK-*.tar.gz | grep -v '/$' | tail -n +$(($COUNT+1)) | xargs -I {} rm -- {}
		#
		else
		echo "No such file or directory. Nothing to backup, you enter $1"
                (>&2 echo "No such file or directory. Nothing to backup, you enter $1")
		exit 3
		fi
	else
	echo "Second parametr must be a count of stored backups, you enterd $2"
	(>&2 echo "Second parametr must be a count of stored backups, you enterd $2")
	exit 2
	fi
fi
