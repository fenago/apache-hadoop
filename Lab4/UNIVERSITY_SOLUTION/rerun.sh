#!/bin/bash
export HADOOP_HOME=/home/hdoop/hadoop-2.7.0
export LD_LIBRARY_PATH=$HADOOP_HOME/lib/native/Linux-amd64-64
export CLASSPATH=$HADOOP_HOME/share/hadoop/mapreduce/*:$HADOOP_HOME/share/hadoop/mapreduce/lib/*:$HADOOP_HOME/share/hadoop/common/lib/*:$HADOOP_HOME/share/hadoop/common/*:$HADOOP_HOME/share/hadoop/tools/lib/*:$HADOOP_HOME/share/hadoop/yarn/*:$HADOOP_HOME/share/hadoop/yarn/lib/*
export HADOOP_CLASSPATH=$CLASSPATH

USER=`whoami`


echo "Deleting OUT folder from local and hadoop filesystem (ignore not found warning)"
rm -rf /home/$USER/Lab4/UNIVERSITY_SOLUTION/OUT
hadoop fs -rm -r /home/$USER/Lab4/UNIVERSITY_SOLUTION


hadoop fs -mkdir -p /home/$USER/Lab4/UNIVERSITY_SOLUTION/DATA
hadoop fs -put /home/$USER/Lab4/UNIVERSITY_SOLUTION/DATA/university.txt /home/$USER/Lab4/UNIVERSITY_SOLUTION/DATA

hadoop jar University.jar University.UniversityDriver /home/$USER/Lab4/UNIVERSITY_SOLUTION/DATA/university.txt /home/$USER/Lab4/UNIVERSITY_SOLUTION/OUT

hadoop fs -copyToLocal  /home/$USER/Lab4/UNIVERSITY_SOLUTION/OUT /home/$USER/Lab4/UNIVERSITY_SOLUTION/OUT
