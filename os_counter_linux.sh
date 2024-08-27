# cpu, mem, IO, current usage for linux and oracle dbs
# 2023.06.02  puff@mail.ru created 
# 2024.08.27  puff@mail.ru 2 github.com sync2


export FN=cpu_`/usr/bin/hostname`
echo `date +'%Y/%m/%d %H:%M:%S'`,`vmstat -n 1 2 | tail -1 | awk '{print $(NF-3)+$(NF-4)}'` >> ${FN}.csv
#head -1     ${FN}.csv        >      ${FN}.tmp
echo Date, ${FN}              >     ${FN}.tmp
tail -50000 ${FN}.csv        >>     ${FN}.tmp
sort -r     ${FN}.tmp | uniq >      ${FN}_tailed.csv



#disk queue length

export FN=disk_queue_length_`/usr/bin/hostname`
echo `date +'%Y/%m/%d %H:%M:%S'`,`vmstat 3 2 | tail -1 | awk '{print ($(NF-7)+$(NF-8))*4096/1024/1024}'` >> ${FN}.csv
#head -1     ${FN}.csv        >      ${FN}.tmp
echo Date, ${FN}              >     ${FN}.tmp
tail -50000 ${FN}.csv        >>     ${FN}.tmp
sort -r     ${FN}.tmp | uniq >      ${FN}_tailed.csv


#DF part:

#DF home free Mb
export FN=home_free_mbytes_`/usr/bin/hostname`
echo `date +'%Y/%m/%d %H:%M:%S'`,`df -m | grep home  |  awk '{print ($4)}'` >> ${FN}.csv
#head -1     ${FN}.csv        >      ${FN}.tmp
echo Date, ${FN}              >     ${FN}.tmp
tail -50000 ${FN}.csv        >>     ${FN}.tmp
sort -r     ${FN}.tmp | uniq >      ${FN}_tailed.csv


#DF root free Mb
export FN=root_free_mbytes_`/usr/bin/hostname`
echo `date +'%Y/%m/%d %H:%M:%S'`,`df -m | grep "root"  |  awk '{print ($4)}'` >> ${FN}.csv
#head -1     ${FN}.csv        >      ${FN}.tmp
echo Date, ${FN}              >     ${FN}.tmp
tail -50000 ${FN}.csv        >>     ${FN}.tmp
sort -r     ${FN}.tmp | uniq >      ${FN}_tailed.csv

#memory free in OS

export FN=memory_free_mbytes_available_`/usr/bin/hostname`
echo `date +'%Y/%m/%d %H:%M:%S'`,`free -m | tail -2 | head -1 |  awk '{ print $NF }'` >> ${FN}.csv
#head -1     ${FN}.csv        >      ${FN}.tmp
echo Date, ${FN}              >     ${FN}.tmp
tail -50000 ${FN}.csv        >>     ${FN}.tmp
sort -r     ${FN}.tmp | uniq >      ${FN}_tailed.csv


#memory total RAM in OS
export FN=memory_total_mbytes_`/usr/bin/hostname`
echo `date +'%Y/%m/%d %H:%M:%S'`,`free -m | tail -2 | head -1 | awk '{print $2}'` >> ${FN}.csv
#head -1     ${FN}.csv        >      ${FN}.tmp
echo Date, ${FN}              >     ${FN}.tmp
tail -50000 ${FN}.csv        >>     ${FN}.tmp
sort -r     ${FN}.tmp | uniq >      ${FN}_tailed.csv


#memory used percent
export FN=memory_used_percent_`/usr/bin/hostname`
echo `date +'%Y/%m/%d %H:%M:%S'`,`free -m | tail -2 | head -1 | awk '{print (($2-$NF)/$2)*100}'` >> ${FN}.csv
#head -1     ${FN}.csv        >      ${FN}.tmp
echo Date, ${FN}              >     ${FN}.tmp
tail -50000 ${FN}.csv        >>     ${FN}.tmp
sort -r     ${FN}.tmp | uniq >      ${FN}_tailed.csv




#memory shared gbytes
export FN=memory_shared_used_gb_`/usr/bin/hostname`
echo `date +'%Y/%m/%d %H:%M:%S'`,`ipcs -m | awk '{sum += $5/1024/1024/1024} END {print sum}'` >> ${FN}.csv
#head -1     ${FN}.csv        >      ${FN}.tmp
echo Date, ${FN}              >     ${FN}.tmp
tail -50000 ${FN}.csv        >>     ${FN}.tmp
sort -r     ${FN}.tmp | uniq >      ${FN}_tailed.csv


#memory shared segments count
export FN=memory_shared_segmetns_count_`/usr/bin/hostname`
echo `date +'%Y/%m/%d %H:%M:%S'`,`ipcs -m | wc -l | awk '{print $1-4}' ` >> ${FN}.csv
#head -1     ${FN}.csv        >      ${FN}.tmp
echo Date, ${FN}              >     ${FN}.tmp
tail -50000 ${FN}.csv        >>     ${FN}.tmp
sort -r     ${FN}.tmp | uniq >      ${FN}_tailed.csv


#oracle instances count
export FN=instance_count_`/usr/bin/hostname`
echo `date +'%Y/%m/%d %H:%M:%S'`,`ps -ef | grep smon | grep -v grep | grep -v "+" | wc -l ` >> ${FN}.csv
#head -1     ${FN}.csv        >      ${FN}.tmp
echo Date, ${FN}              >     ${FN}.tmp
tail -50000 ${FN}.csv        >>     ${FN}.tmp
sort -r     ${FN}.tmp | uniq >      ${FN}_tailed.csv


#swap used mbytes
export FN=swap_used_mbytes_`/usr/bin/hostname`
echo `date +'%Y/%m/%d %H:%M:%S'`,`free -m | tail -1 | awk '{print $3}'` >> ${FN}.csv
#head -1     ${FN}.csv        >      ${FN}.tmp
echo Date, ${FN}              >     ${FN}.tmp
tail -50000 ${FN}.csv        >>     ${FN}.tmp
sort -r     ${FN}.tmp | uniq >      ${FN}_tailed.csv


#semaphores allocated 
export FN=semaphores_allocated`/usr/bin/hostname`
echo `date +'%Y/%m/%d %H:%M:%S'`,`ipcs -lu | grep "allocated semaphores" | awk '{print $4}'` >> ${FN}.csv
#head -1     ${FN}.csv        >      ${FN}.tmp
echo Date, ${FN}              >     ${FN}.tmp
tail -50000 ${FN}.csv        >>     ${FN}.tmp
sort -r     ${FN}.tmp | uniq >      ${FN}_tailed.csv



#free -m buff/cache
export FN=free-m_buff_cache_`/usr/bin/hostname`
echo `date +'%Y/%m/%d %k:%M:%S'`,`free -m | tail -2 | head -1 | awk '{ print ($(NF-1)) }'` >> ${FN}.csv
#head -1     ${FN}.csv        >      ${FN}.tmp
echo Date, ${FN}              >     ${FN}.tmp
tail -50000 ${FN}.csv        >>     ${FN}.tmp
sort -r     ${FN}.tmp | uniq >      ${FN}_tailed.csv

#network speed current in DEV
#ll /sys/class/net
#while true; do old_rx=`cat /sys/class/net/eth0/statistics/rx_bytes`; sleep 10; rx=`cat /sys/class/net/eth0/statistics/rx_bytes`; echo "scale=2; (${rx}-${old_rx})/10/1024/1024" | bc; echo "`date +'"%d/%m/%Y %H:%M:%S %a"'`: Current Network speed usage Mbytes/sec"; done

