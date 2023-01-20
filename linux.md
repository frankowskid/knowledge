df -h

du -sh *

 

 

Process on ports:

netstat -a -n -o

 

Check if open port:

nc -vz qcmailhost.testbbh.com 25

 

 

Threads per process:

ps huH p <PID_OF_U_PROCESS> | wc -l

 

ps -o thcount <pid>

watch ps -o thcount <pid>

 

Threads per process CPU usage

ps -T -p <pid>
 
Check connection when no wget nor curl available
 
timeout 10s bash -c ':> /dev/tcp/destimantion-url/8061'
