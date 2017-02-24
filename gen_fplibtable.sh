#!/bin/bash
[[ -d $1 ]] || { echo -e "Error root path pretty\nUsage: gen_fplibtable.sh root_path_pretty dir_path_store_ft-lib-table"; exit 1; } 
export root_pretty=$1
export MYLIBSMOD=MYLIBSMOD
export fplib_path=./fp-lib-table
[[ $2 ]] && fplib_path=$2/fp-lib-table
echo "(fp_lib_table" > ${fplib_path}
find $root_pretty -type d  -exec bash -c '
full_name_path={};
[[ $(basename ${full_name_path}) =~ ((.+).pretty) ]] && 
{ 
    footprint_line="  (lib (name ${BASH_REMATCH[2]})(type KiCad)(uri \${MYLIBSMOD}/${BASH_REMATCH[1]})(options  \"\")(descr \"\"))";
    echo "$footprint_line" >> ${fplib_path}; 
}' \;
echo ")" >> ${fplib_path}


