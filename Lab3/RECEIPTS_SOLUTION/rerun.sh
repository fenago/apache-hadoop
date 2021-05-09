#!/bin/bash

export HADOOP_HOME=/home/hdoop/hadoop-2.7.0
export LD_LIBRARY_PATH=$HADOOP_HOME/lib/native/Linux-amd64-64
export CLASSPATH=$HADOOP_HOME/share/hadoop/mapreduce/*:$HADOOP_HOME/share/hadoop/mapreduce/lib/*:$HADOOP_HOME/share/hadoop/common/lib/*:$HADOOP_HOME/share/hadoop/common/*:$HADOOP_HOME/share/hadoop/tools/lib/*:$HADOOP_HOME/share/hadoop/yarn/*:$HADOOP_HOME/share/hadoop/yarn/lib/*
export HADOOP_CLASSPATH=$CLASSPATH

USER=`whoami`

echo "Deleting OUT folder from local and hadoop filesystem (ignore not found warning)"
rm -rf /home/$USER/Lab3/RECEIPTS_SOLUTION/OUT
hadoop fs -rm -r /home/$USER/Lab3/RECEIPTS_SOLUTION/

hadoop fs -mkdir -p /home/$USER/Lab3/RECEIPTS_SOLUTION/DATA/
hadoop fs -put /home/$USER/Lab3/RECEIPTS_SOLUTION/DATA/receipts.txt /home/$USER/Lab3/RECEIPTS_SOLUTION/DATA

hadoop jar Receipts.jar Receipts.ReceiptsDriver /home/$USER/Lab3/RECEIPTS_SOLUTION/DATA/receipts.txt /home/$USER/Lab3/RECEIPTS_SOLUTION/OUT 

hadoop fs -copyToLocal  /home/hdoop/Lab3/RECEIPTS_SOLUTION/OUT /home/hdoop/Lab3/RECEIPTS_SOLUTION/OUT

