#!/bin/sh

# $1 is gid.
# $2 is the number of files.
# $3 is the path of the first file.

DOWNLOAD=/data/_dl       # no trailing slash!
COMPLETE=/data/completed # no trailing slash!
LOG=/data/mvcompleted.log
SRC=$3

echo "\n" >> "$LOG"
echo "\n" >> "$LOG"
echo "====================================================================" >> "$LOG"
echo `date` "INFO  Task ID: " $1 " Completed." >> "$LOG"
echo "\n" >> "$LOG"

if [ "$2" == "0" ]; then
    echo `date` "INFO  no file to move for" "$1". >> "$LOG"
    exit 0
fi

SRCDIR=`dirname "$SRC"`
DSTDIR=`echo $SRCDIR | sed "s,$DOWNLOAD,$COMPLETE,g"`
CTLFILE="$3".aria2

if [ "$SRCDIR" == "$DSTDIR" ]; then
    echo `date` "ERROR " "$SRC" not under "$DOWNLOAD". >> "$LOG"
    exit 0
else
    if [ ! -d "$DSTDIR" ]; then
	if [ -e "$DSTDIR" ]; then
	    echo `data` "ERROR " "$DSTDIR" exist but not directory. >> "$LOG"
	    exit 0
	else
	    mkdir -p "$DSTDIR"
	fi
    fi
    if [ ! -w "$DSTDIR" ]; then
	echo `data` "ERROR " "$DSTDIR" not writable. >> "$LOG"
	exit 0
    else
	echo `date` "INFO  " "$3" moved to "$DSTDIR". >> "$LOG"
	mv --backup=t "$3" "$DSTDIR" >> "$LOG" 2>&1
	rm "$CTLFILE" >> "$LOG" 2>&1
	while [ "$SRCDIR" != "$DOWNLOAD" ]; do
	    if [ ! $(ls -A "$SRCDIR") ]; then
	       rmdir "$SRCDIR" >>"$LOG" 2>&1
	       SRCDIR=`dirname "$SRCDIR"`
	    else
		exit 1
	    fi
	done
	exit $?
    fi
fi
