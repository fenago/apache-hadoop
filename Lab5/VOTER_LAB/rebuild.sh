#!/bin/bash

USER=`whoami`

export HADOOP_HOME=/home/hdoop/hadoop-2.7.0
export LD_LIBRARY_PATH=$HADOOP_HOME/lib/native/Linux-amd64-64
export CLASSPATH=$HADOOP_HOME/share/hadoop/mapreduce/*:$HADOOP_HOME/share/hadoop/mapreduce/lib/*:$HADOOP_HOME/share/hadoop/common/lib/*:$HADOOP_HOME/share/hadoop/common/*:$HADOOP_HOME/share/hadoop/tools/lib/*:$HADOOP_HOME/share/hadoop/yarn/*:$HADOOP_HOME/share/hadoop/yarn/lib/*:/home/$USER/Lab5/DEV301-v5.2-Lab5/VOTER_LAB/*
export HADOOP_CLASSPATH=$CLASSPATH

javac -d classes VoterMapper.java
javac -d classes VoterReducer.java
jar -cvf Voter.jar -C classes/ .
javac -classpath $CLASSPATH:Voter.jar -d classes VoterDriver.java
jar -cvf Voter.jar -C classes/ .
javac -classpath $CLASSPATH:Voter.jar -d classes VoterTest.java
jar -cvf Voter.jar -C classes/ .
