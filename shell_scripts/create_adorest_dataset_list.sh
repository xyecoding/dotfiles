# define a list
folders=(Real_Images Synthetic_Images)
root_dir=$(pwd)
declare -A classes

train_file=traintxt
test_file=testtxt

rm -rf $train_file $test_file

# use a element of a list
class_folder=$(ls ${folders[0]})

# add keys and values to the map
idx=0
for folder in ${class_folder}
do
	echo $folder
	classes[$folder]=$idx
	echo ${classes[$folder]}
	((idx=idx+1))
done

for folder in ${folders[*]}
do 
	for file in $(ls $folder)
	do 
		file_path=$root_dir/$folder/$file
		list_path=$file_path/list.txt
		ls {$file_path/*.jpg,$file_path/*.jpeg} 2>/dev/null | shuf | sed "s/$/ ${classes[$file]}/g" > $list_path 
		if test $folder = ${folders[0]}; then
			head -n 2000 $list_path >> $train_file 
			sed -i '1,2000d' $list_path

			head -n 500 $list_path >> $test_file 
			sed -i '1,500d' $list_path
		elif test $folder = ${folders[1]}; then
			head -n 500 $list_path >> $test_file 
			sed -i '1,500d' $list_path
		fi
	done
done

