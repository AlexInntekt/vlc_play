# this scripts reads a file line by line, extracts the pid from each line, checks if the process is still alive, and if 
# it's dead, then it removes that specific line from the log file
#provide file as argument

export file_of_pids=$1

while IFS= read -r line; do
    export pid=$(echo $line | cut -d "<" -f2 | cut -d ">" -f1)
    # echo $pid

    if kill -0 $pid;
    then
        continue
    else
        bash delete_log.sh $pid $file_of_pids
    fi

    # if kill -0 6213; then echo "e viu"; else echo "e mort"; fi

done < $file_of_pids