source ./$1-miner-env.sh
host=`hostname`
time=$(date "+%Y.%m.%d")
num=0000
next=$3$num
WDPOST_DISABLE=$2 NEXT_SECTOR_NUM=$next  lotus-miner-intel-0.10. run 2>&1 | tee -a /data-ceph-2/space-race/log/miner-$host-$time.log
