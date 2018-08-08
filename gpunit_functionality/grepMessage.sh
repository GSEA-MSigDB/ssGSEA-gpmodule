# Copyright (c) 2003-2017 Broad Institute, Inc., Massachusetts Institute of Technology, and Regents of the University of California.  All rights reserved.
#!/bin/sh

# We're ignoring the file passed in $2 and just checking for the presence of a match to the pattern passed in $1
grep -q "$1" $3
exit $?
