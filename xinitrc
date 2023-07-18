#!/bin/sh

/usr/bin/pipewire &
/usr/bin/pipiwire-pulse &
/usr/bin/pipewire-media-session &
exec slstatus &
exec dwm
