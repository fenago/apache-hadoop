#!/bin/bash

/home/hdoop/restart-yarn.sh > /dev/null


rm -rf ~/DISTRIBUTED_CACHE/STAT_OUT

hadoop jar Stats.jar Stats.StatsDriver ~/DISTRIBUTED_CACHE/DATA/university.txt ~/DISTRIBUTED_CACHE/STAT_OUT

