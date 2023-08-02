for file in $(find . -type f -name "*.c")
do
	name=$(echo $file | cut -d'/' -f2 | cut -d'.' -f1)
	nameShow=$(echo $file | cut -d'/' -f2)
	gcc -o $name $file 2> /dev/null
	if [ -f $name ]
	then
		ans=$(./$name)
		if [ $ans == 20 ]
		then
			point=10
		else
			point=7
		fi
	else
		point=5
	fi
	printf "%s\t\t%s\n" $nameShow $point
done
