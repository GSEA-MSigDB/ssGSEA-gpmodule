# Copyright (c) 2012-2017 Broad Institute, Inc., Massachusetts Institute of Technology, and Regents of the University of California.  All rights reserved.
#!/bin/sh
# Check if DIFF_DATASETS_HOME is set
if [ ! -d "${DIFF_DATASETS_HOME}" ]; then echo "Please set DIFF_DATASETS_HOME with the location of the DiffDatasets repo"; exit 1; fi

diffdir=`mktemp -d diffdir.XXXXXX`
mkdir $diffdir/in1
mkdir $diffdir/in2
base1=`basename $1`
base2=`basename $2`

ln -s $1 $diffdir/in1/$base1
ln -s $2 $diffdir/in2/$base2

cd $diffdir

/opt/R/2.15.3/bin/Rscript --no-save --quiet --slave --no-restore ${DIFF_DATASETS_HOME}/src/run_diff_datasets_gpunit.R --first.input.file="in1/$base1" --second.input.file="in2/$base2" --round.method=round --round.digits=6
status=$?
cd ..
rm -rf $diffdir
exit $status
