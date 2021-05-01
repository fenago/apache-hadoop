#!/bin/bash
export HADOOP_HOME=/home/hdoop/hadoop-2.7.0
export LD_LIBRARY_PATH=$HADOOP_HOME/lib/native/Linux-amd64-64
export CLASSPATH=$HADOOP_HOME/share/hadoop/mapreduce/*:$HADOOP_HOME/share/hadoop/mapreduce/lib/*:$HADOOP_HOME/share/hadoop/common/lib/*:$HADOOP_HOME/share/hadoop/common/*:$HADOOP_HOME/share/hadoop/tools/lib/*:$HADOOP_HOME/share/hadoop/yarn/*:$HADOOP_HOME/share/hadoop/yarn/lib/*
export HADOOP_CLASSPATH=$CLASSPATH
USER=`whoami`

rm -rf /home/$USER/5/SLOW_LAB/OUT

ARGS=$1

hadoop jar Slow.jar Slow.SlowDriver $ARGS /home/$USER/5/SLOW_LAB/DATA/receipts.txt /home/$USER/5/SLOW_LAB/OUT 

