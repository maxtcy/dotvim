#!/bin/bash
lnfile="mtkcam_inc"
mtkcam3="mtkcam3"	#keyword
tag_dir=".git/tag_dir/"

############################################
file_size_check()
{
	if [ -d $tag_dir ]; then
		pre_size=1000
		while true;
		do
			size=$(du -h $tag_dir | awk '{print $1}' | tr -dc '0-9')
			sleep 8
			if  [ $pre_size -ne $size ]; then
				echo " not eq"
				pre_size=$size
			else
				echo "Same"
				exit 0
			fi
		done
	else
		echo "Check Fail"
	fi
}
############################################
# Main Function
############################################

if [ "$#" -ne 1 ] || ! [ -d "$1" ]; then

case $1 in
	1)

	cur_dir="${PWD##*/}" 	#get current folder name or grep -o "[^/]*$"
	if [[ $cur_dir == $mtkcam3 ]];
	then
		ln -s -f ../mtkcam/ cam_inc
		echo "OK"
		#ls -al | ag mtkcam_inc
	else
		echo "FAIL"
	fi
	;;
	2)
	file_size_check
	;;
esac

fi
