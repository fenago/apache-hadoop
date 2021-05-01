#!/bin/bash

export HADOOP_HOME=/home/hdoop/hadoop-2.7.0
export LD_LIBRARY_PATH=$HADOOP_HOME/lib/native/Linux-amd64-64
export CLASSPATH=$HADOOP_HOME/share/hadoop/mapreduce/*:$HADOOP_HOME/share/hadoop/mapreduce/lib/*:$HADOOP_HOME/share/hadoop/common/lib/*:$HADOOP_HOME/share/hadoop/common/*:$HADOOP_HOME/share/hadoop/tools/lib/*:$HADOOP_HOME/share/hadoop/yarn/*:$HADOOP_HOME/share/hadoop/yarn/lib/*
export HADOOP_CLASSPATH=$CLASSPATH

USER=`whoami`

echo "Deleting OUT folder from local and hadoop filesystem (if exists)"
rm -rf /home/$USER/Lab4/UNIVERSITY_LAB/OUT
hadoop fs -rm -r /home/$USER/Lab4/UNIVERSITY_LAB


hadoop fs -mkdir -p /home/$USER/Lab4/UNIVERSITY_LAB/DATA
hadoop fs -put /home/$USER/Lab4/UNIVERSITY_LAB/DATA/university.txt /home/$USER/Lab4/UNIVERSITY_LAB/DATA

hadoop jar University.jar University.UniversityDriver /home/$USER/Lab4/UNIVERSITY_LAB/DATA/university.txt /home/$USER/Lab4/UNIVERSITY_LAB/OUT

hadoop fs -copyToLocal  /home/$USER/Lab4/UNIVERSITY_LAB/OUT /home/$USER/Lab4/UNIVERSITY_LAB/OUT
