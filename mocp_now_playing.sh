while true
do
mocp --format %file | rev | cut -d '/' -f 1 | rev | cut -d '.' -f 1 > /tmp/mocp_now_playing.txt
sleep 5
done
