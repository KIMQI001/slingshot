source /data-ceph-2/slingshot/script/miner/$1-miner-env.sh 
ip=`/sbin/ifconfig eth0 | awk '/inet/ {print $2}' | cut -f2 -d ":" |awk 'NR==1 {print $1}'`
num=141
port=$2$num
Path=/data-$3
host=`hostname`
time=$(date "+%Y.%m.%d")

TRUST_PARAMS=1 TMPDIR=$Path FIL_PROOFS_PARENT_CACHE=$Path/parent WORKER_PATH=$Path/worker  RUST_LOG=trace FIL_PROOFS_USE_MULTICORE_SDR=1 FIL_PROOFS_USE_GPU_COLUMN_BUILDER=1 FIL_PROOFS_USE_GPU_TREE_BUILDER=1 lotus-worker-amd-0.10. run --listen=$ip:$port --precommit2=false --commit=false --device=$host 2>&1 | tee -a /data-ceph-2/space-race/log/p1-$host-$time.log
