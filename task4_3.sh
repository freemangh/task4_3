#!/bin/bash
# Mirantis Internship 2018
# Task 4.3
# Eugeniy Khvastunov
# Simple back-up script
CURPATH="$(pwd)"
SCRPATH="$(echo $0 | rev | cut -c 11- | rev)"
OUTFILE=$CURPATH/$SCRPATH'task4_3.out'
TMPFILE=$CURPATH/$SCRPATH'task4_3.tmp'
