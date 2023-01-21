#!/bin/bash

device="Touchpad"
touchpad_id=$(xinput list | grep "$device" | grep -Po "id=\K\d*")
touchpad_state=$(xinput list-props "$touchpad_id" | grep -Po "Enabled.*\K\d")

case $touchpad_state in
  0)
    echo "enable $device"
    xinput enable "$touchpad_id"
    ;;
  1)
    echo "disable $device"
    xinput disable "$touchpad_id"
    ;;
esac
