memUsed=`free -m | head -2 | tail -1 | awk '{print $3}'`

totalMem=`free -m | head -2 | tail -1 | awk '{print $2}'`

memUsedPercentage=`expr $memUsed \* 100 / $totalMem`

echo -e "`date +"%r %D"`\t$memUsedPercentage" >> mem_report.tsv
