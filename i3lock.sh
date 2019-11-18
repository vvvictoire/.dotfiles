scrot /tmp/lock.png
convert -scale 10% -scale 1000%  /tmp/lock.png /tmp/pixelated.png
rm /tmp/lock.png
i3lock --image /tmp/pixelated.png
rm /tmp/pixelated.png
