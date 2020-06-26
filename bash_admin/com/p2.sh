echo "p2 pid: "$$
export ppid=$(ps -ef | awk '$2 ~ /\<1148\>/ { print $3; }')
echo $ppid
while [ 1 -eq 1 ]; do sleep 3s; echo "oh"; done

