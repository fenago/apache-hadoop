#!/usr/bin/env bash


/home/hdoop/restart-yarn.sh > /dev/null


USER=`whoami`


echo "Deleting OUT folder from local and hadoop filesystem (ignore not found warning)"
rm -rf /home/$USER/Lab9/STREAMING_RECEIPTS/OUT
hadoop fs -rm -r /home/$USER/Lab9/STREAMING_RECEIPTS

hadoop fs -mkdir -p /home/$USER/Lab9/STREAMING_RECEIPTS/DATA
hadoop fs -put -f /home/$USER/Lab9/STREAMING_RECEIPTS/DATA/receipts.txt /home/$USER/Lab9/STREAMING_RECEIPTS/DATA



# 1) test map script
echo -e "1901 588 525 63 588 525 63" | ./receipts_mapper.sh | od -c
# 2) test reduce script
echo -e "summary\t1901_63" | ./receipts_reducer.sh | od -c
# 3) map/reduce on Hadoop
export JOBHOME=/home/$USER/Lab9/STREAMING_RECEIPTS
export CONTRIB=/home/hdoop/hadoop-2.7.0/share/hadoop/tools/lib
export STREAMINGJAR=hadoop-streaming-2.7.0.jar
export THEJARFILE=$CONTRIB/$STREAMINGJAR
rm -rf $JOBHOME/OUT
hadoop jar $THEJARFILE \
  -mapper 'receipts_mapper.sh' \
  -file receipts_mapper.sh \
  -reducer 'receipts_reducer.sh' \
  -file receipts_reducer.sh \
  -input  $JOBHOME/DATA/receipts.txt  \
  -output  $JOBHOME/OUT

rm -r $JOBHOME/OUT
hadoop fs -copyToLocal  $JOBHOME/OUT $JOBHOME/OUT

