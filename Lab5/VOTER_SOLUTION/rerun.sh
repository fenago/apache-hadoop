#!/bin/bash

USER=`whoami`

export HADOOP_HOME=/home/hdoop/hadoop-2.7.0
export LD_LIBRARY_PATH=$HADOOP_HOME/lib/native/Linux-amd64-64
export CLASSPATH=$HADOOP_HOME/share/hadoop/mapreduce/*:$HADOOP_HOME/share/hadoop/mapreduce/lib/*:$HADOOP_HOME/share/hadoop/common/lib/*:$HADOOP_HOME/share/hadoop/common/*:$HADOOP_HOME/share/hadoop/tools/lib/*:$HADOOP_HOME/share/hadoop/yarn/*:$HADOOP_HOME/share/hadoop/yarn/lib/*:$HADOOP_HOME/*:/home/$USER/5/VOTER_SOLUTION/*
export HADOOP_CLASSPATH=$CLASSPATH

rm -rf /home/$USER/Lab5/VOTER_SOLUTION/OUT

ARGS=$1

hadoop fs -mkdir -p /home/$USER/Lab5/VOTER_SOLUTION/DATA/
hadoop fs -put /home/$USER/Lab5/VOTER_SOLUTION/DATA/myvoter.csv /home/$USER/Lab5/VOTER_SOLUTION/DATA

hadoop jar Voter.jar Voter.VoterDriver $ARGS /home/$USER/Lab5/VOTER_SOLUTION/DATA/myvoter.csv /home/$USER/Lab5/VOTER_SOLUTION/OUT

hadoop fs -copyToLocal  /home/$USER/Lab5/VOTER_SOLUTION/OUT /home/$USER/Lab5/VOTER_SOLUTION/OUT

