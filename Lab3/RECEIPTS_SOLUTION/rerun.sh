#!/bin/bash

export HADOOP_HOME=/home/hdoop/hadoop-2.7.0
export LD_LIBRARY_PATH=$HADOOP_HOME/lib/native/Linux-amd64-64
export CLASSPATH=$HADOOP_HOME/share/hadoop/mapreduce/*:$HADOOP_HOME/share/hadoop/mapreduce/lib/*:$HADOOP_HOME/share/hadoop/common/lib/*:$HADOOP_HOME/share/hadoop/common/*:$HADOOP_HOME/share/hadoop/tools/lib/*:$HADOOP_HOME/share/hadoop/yarn/*:$HADOOP_HOME/share/hadoop/yarn/lib/*
export HADOOP_CLASSPATH=$CLASSPATH

USER=`whoami`

rm -rf /home/$USER/Lab3/RECEIPTS_LAB/OUT

hadoop fs -mkdir -p /home/$USER/Lab3/RECEIPTS_LAB/DATA/receipts.txt
hadoop fs -put /home/$USER/Lab3/RECEIPTS_LAB/DATA/receipts.txt /home/$USER/Lab3/RECEIPTS_LAB/DATA

hadoop jar Receipts.jar Receipts.ReceiptsDriver /home/$USER/Lab3/RECEIPTS_LAB/DATA/receipts.txt /home/$USER/Lab3/RECEIPTS_LAB/OUT 

hadoop fs -copyToLocal  /home/hdoop/Lab3/RECEIPTS_LAB/OUT /home/hdoop/Lab3/RECEIPTS_LAB/OUT

