/home/jun/workspace/code/dpdk/build/app/dpdk-testpmd -l 0,2,3,4,5 --socket-mem=1024 -n 4 \
          --vdev 'net_vhost0,iface=/tmp/vh1,client=1' \
          --vdev 'net_vhost1,iface=/tmp/vh2,client=1' -- \
          --portmask=f -i --rxq=1 --txq=1 \
          --nb-cores=4 --forward-mode=io 
