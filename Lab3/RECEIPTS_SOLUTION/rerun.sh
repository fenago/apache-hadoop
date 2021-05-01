#!/bin/bash

export HADOOP_HOME=/home/hdoop/hadoop-2.5.1
export LD_LIBRARY_PATH=$HADOOP_HOME/lib/native/Linux-amd64-64
export CLASSPATH=$HADOOP_HOME/share/hadoop/mapreduce/*:$HADOOP_HOME/share/hadoop/mapreduce/lib/*:$HADOOP_HOME/share/hadoop/common/lib/*:$HADOOP_HOME/share/hadoop/common/*:$HADOOP_HOME/share/hadoop/tools/lib/*:$HADOOP_HOME/share/hadoop/yarn/*:$HADOOP_HOME/share/hadoop/yarn/lib/*
export HADOOP_CLASSPATH=$CLASSPATH

USER=`whoami`

rm -rf /home/$USER/3/RECEIPTS_SOLUTION/OUT
hadoop jar Receipts.jar Receipts.ReceiptsDriver /home/$USER/3/RECEIPTS_SOLUTION/DATA/receipts.txt /home/$USER/3/RECEIPTS_SOLUTION/OUT 
