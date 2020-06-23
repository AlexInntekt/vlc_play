
export pid=$1
export log_file=$2

export line_to_delete=$(grep -n "pid<$pid>" $log_file | cut -d : -f1)"d"; sed $line_to_delete $log_file -i 
