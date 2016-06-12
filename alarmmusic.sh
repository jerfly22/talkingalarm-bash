 

#!/bin/bash

PLAYER=/usr/bin/mplayer
SONG="~/Scripts/music/alarm.mp3"
killall wakeup-volume
/usr/local/bin/wakeup-volume&
$PLAYER -loop 1  "$SONG"
sleep 5
