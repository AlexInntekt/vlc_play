# this scripts reads a file line by line, extracts the pid from each line, checks if the process is still alive, and if 
# it's dead, then it removes that specific line from the log file
#provide file as argument

export file_of_pids=$1

while IFS= read -r line; do
    export pid=$(echo $line | cut -d "<" -f2 | cut -d ">" -f1)
    echo $pid
    export is_p_dead=$(kill -0 $pid)
    if [ -z $is_p_dead ];
    then
        bash delete_log.sh $pid $file_of_pids
    fi
done < $file_of_pids