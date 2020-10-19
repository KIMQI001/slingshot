while true;do
    clear
    lotus sync status
    
    echo
    echo Miner Info
    lotus-miner --color info 

    echo
    echo Sector List
    lotus-miner sectors list |tail -5

    sleep 25
done

