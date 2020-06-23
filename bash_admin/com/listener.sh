#this is an example of process that prints the data from standard input

echo $BASHPID
while IFS= read -r line; do
  echo "Here is your message:"
  printf '%s\n' "$line"
done

#how to test: type the following command, replacing BASHPID with the current script pid:
#   echo "message from another process!" > /proc/BASHPID/fd/0
