#!/bin/bash

export HADOOP_HOME=/home/hdoop/hadoop-2.7.0
export LD_LIBRARY_PATH=$HADOOP_HOME/lib/native/Linux-amd64-64
export CLASSPATH=$HADOOP_HOME/share/hadoop/mapreduce/*:$HADOOP_HOME/share/hadoop/mapreduce/lib/*:$HADOOP_HOME/share/hadoop/common/lib/*:$HADOOP_HOME/share/hadoop/common/*:$HADOOP_HOME/share/hadoop/tools/lib/*:$HADOOP_HOME/share/hadoop/yarn/*:$HADOOP_HOME/share/hadoop/yarn/lib/*export HADOOP_CLASSPATH=$CLASSPATH

USER=`whoami`

rm -rf /home/$USER/Lab8/STATISTICS_SOLUTION/UNIV_OUT
rm -rf /home/$USER/Lab8/STATISTICS_SOLUTION/STAT_OUT


hadoop jar WholeJob.jar WholeJob.WholeJobDriver -D var1="verbal" -D var2="math" /home/$USER/Lab8/STATISTICS_SOLUTION/DATA/university.txt /home/$USER/Lab8/STATISTICS_SOLUTION/UNIV_OUT /home/$USER/Lab8/STATISTICS_SOLUTION/STAT_OUT


