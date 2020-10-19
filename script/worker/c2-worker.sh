source /data-ceph-2/slingshot/script/miner/$1-miner-env.sh 
ip=`/sbin/ifconfig eth0 | awk '/inet/ {print $2}' | cut -f2 -d ":" |awk 'NR==1 {print $1}'`
num=341
port=$2$num
Path=/seal-$2
host=`hostname`
time=$(date "+%Y.%m.%d")

TRUST_PARAMS=1 CUDA_VISIBLE_DEVICES=$2 TMPDIR=$Path FIL_PROOFS_PARENT_CACHE=$Path/parent WORKER_PATH=$Path  RUST_LOG=trace FIL_PROOFS_PARENT_CACHE=/data-ceph-2/space-race/filecoin-proof-parameters lotus-worker-intel-0.10. run --listen=$ip:$port --precommit1=false --precommit2=false --device=$host-$Path --addpiece=false --hkcaddpiece=false 2>&1 | tee -a /data-ceph-2/space-race/log/c2-$host-$time.log
