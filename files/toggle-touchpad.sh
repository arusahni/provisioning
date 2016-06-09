#!/bin/sh

DEVICE_ID=$(xinput list | grep -i TouchPad | cut -f2 | cut -f2 -d'=')
STATE=$(xinput list-props "$DEVICE_ID" | grep "Device Enabled" | cut -f3)
if [ "$STATE" -eq 0 ] ; then
    xinput set-prop "$DEVICE_ID" "Device Enabled" 1
    NOTIFYCMD_TEXT="Touchpad has been <b><i>ENABLED</i></b>"
else
    xinput set-prop "$DEVICE_ID" "Device Enabled" 0
    NOTIFYCMD_TEXT="Touchpad has been <b><i>DISABLED</i></b>"
fi
kdialog --passivepopup "$NOTIFYCMD_TEXT" --title "TouchPad state changed"
