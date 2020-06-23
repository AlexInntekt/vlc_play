project_housekeeper()
{
   while [ 1 -eq 1 ];
   do
        bash cleaner.sh ips.log
        bash cleaner.sh ins.log
        sleep 5s
   done
}


project_housekeeper