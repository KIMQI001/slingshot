source /data-ceph-2/slingshot/script/miner/$1-miner-env.sh 
ip=`/sbin/ifconfig eth0 | awk '/inet/ {print $2}' | cut -f2 -d ":" |awk 'NR==1 {print $1}'`
num=241
port=$2$num
Path=/data-$3
host=`hostname`
time=$(date "+%Y.%m.%d")
if  [ ! -d $Path/p2/ ];then
	mkdir $Path/p2/
fi
cp $Path/worker/storage.json $Path/p2-$2/
CUDA_VISIBLE_DEVICES=$2 TRUST_PARAMS=1 TMPDIR=$Path FIL_PROOFS_PARENT_CACHE=$Path/parent WORKER_PATH=$Path/p2-$2  RUST_LOG=info FIL_PROOFS_USE_MULTICORE_SDR=1 FIL_PROOFS_USE_GPU_COLUMN_BUILDER=1 FIL_PROOFS_USE_GPU_TREE_BUILDER=1 p2-lotus-worker-amd-0.10. run --listen=$ip:$port --precommit1=false --commit=false --hkcaddpiece=false --addpiece=false --device=$host 2>&1 | tee -a /data-ceph-2/space-race/log/p2-$host-$time.log
