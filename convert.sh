#! /bin/bash

# What goes before directory name when creating link to that directory index.wiki
DIR_LINK_PREPEND="DIR - "

function ensure_index_created() {
			if  [ ! -f 'index.wiki' ]; then
				touch 'index.wiki'
				echo > index.wiki
			fi
}

root=$(pwd)
mkdir result

files=$(ls *.txt)
cd result

for file in $files; do
	IFS='--'
	read -a arr <<< "$file"
	IFS=' '
	for name in ${arr[@]}; do 

		if echo $name | grep -q '.txt'; then
		stripped=$(basename -s '.txt' $name)

		if [ $(cat $root/$file | grep . | wc -l) -gt 1 ]; then
		touch ${stripped}.wiki
		tail -n +2 $root/$file > ${stripped}.wiki

		ensure_index_created

		echo "* [[$stripped]]" >> index.wiki

		fi

		else

			if [ ! -d $name ]; then
		mkdir $name
			dir_link="[[$name/index.wiki|${DIR_LINK_PREPEND}${name}]]"
			ensure_index_created
		  sed -i "1 i\\* ${dir_link}" index.wiki
			fi

		cd $name
		fi

	done
	cd $root/result
done

