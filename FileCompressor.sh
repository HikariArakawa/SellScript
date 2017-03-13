#!bin/bash
set -eu

file_name=$(date +"%Y%m%d")
target_dir=./test/test
archive_dir=./FileCompressor/archive
target_dir_name=$(dirname ${target_dir})
target_base_name=$(basename ${target_dir})
move=on

if [ ! -e $target_dir ]; then
  echo No such file a directory
  exit 1
fi

if [ $move == on ]; then
  echo Archive file to directory
  echo "======================"
  find $target_dir_name -maxdepth 1 -not -name $target_base_name | xargs -I{} bash -c "echo {}; mv {} ${archive_dir}"
  echo "======================"
  echo Archive dir : $archive_dir
fi

echo Compress File
echo "======================"
tar -zvcf ${target_dir_name}/${file_name}.tar.gz -C $target_dir_name $target_base_name 
echo "======================"
echo Complete:${target_dir_name}/${file_name}.tar.gz

echo Target Dir Delete
rm -R $target_dir
