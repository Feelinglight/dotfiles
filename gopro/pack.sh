#!/bin/bash

set -e

NAME_START="GX"
TARGET_EXT="MP4"

function log_debug
{
    if [ "$DEBUG" == 1 ]; then
        echo $"log: $@"
    fi
}

rm -rf *.LRV
rm -rf *.THM

video_numbers=()
for file in $(ls *."$TARGET_EXT"); do
    log_debug "$file"
    video_numbers+=(${file:4:4}${file:2:2})
done

sorted_names=($(echo "${video_numbers[@]}" | tr ' ' '\n' | sort -n))

log_debug "default order: ${video_numbers[@]}"
log_debug "sorted order:  ${sorted_names[@]}"

new_names=()
real_number=1
for name in ${sorted_names[@]}; do
    current_name="$NAME_START${name:4:2}${name:0:4}.$TARGET_EXT"
    new_name="${real_number}.${TARGET_EXT}"

    log_debug "rename ${current_name} to ${new_name}"
    mv ${current_name} ${new_name}

    new_names+=(${new_name})
    (( real_number++ ))
done

dir_name="$(date +"%Y%m%d")"
mkdir ${dir_name}

mv ${new_names[@]} ${dir_name}
