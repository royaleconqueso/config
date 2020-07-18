xrandr --output eDP-1 --primary --mode 1600x900  & ## correct resolution for my chromebook

#xrandr --output eDP --brightness 0.7 &
#xscreensaver -nosplash &
#exec /usr/bin/xfce4-terminal &
#exec /usr/bin/openbsd-cwm                 #ctrl-enter for term, ctrl-q to quit https://undeadly.org/cgi?action=article&sid=20090502141551
#exec /usr/bin/openbox-session
exec /usr/bin/wmaker --no-clip --no-dock
#exec /usr/bin/ratpoison                  ## "C-t :quit" to quit ratpoison
#exec /home/brock/bin/conkystart.sh &
#exec /home/brock/bin/xflux -z 11109 &

#exec /usr/bin/xfwm4 


#xfce4-terminal &
#exec /usr/bin/kwin_x11


#systemctl disable lightdm.service  and do sudo service lightdm start to start lightdm once, or systemctl enable lightdm.service to have it start automatically again

