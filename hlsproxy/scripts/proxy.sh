#!/bin/sh

set -e

url=$1
user_agent=${2:-Dalvik/2.1.0 (Linux; U; Android 5.1.1; AFTT Build/LVY48F)}

echo $url
echo $user_agent

ffmpeg -loglevel debug -err_detect ignore_err -user_agent "$user_agent" -i "$url" -c copy -hls_time 6 -hls_list_size 20 -hls_flags delete_segments /data/stream.m3u8
