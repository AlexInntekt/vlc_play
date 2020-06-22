echo $BASHPID
while IFS= read -r line; do
  echo "Here is your message:"
  printf '%s\n' "$line"
done


#   echo "message from another process!" > /proc/18251/fd/0
