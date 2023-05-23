
#exec /usr/bin/gnome

#xrandr --output eDP --primary --mode 2560x1440  & ## correct resolution for my 2015 27" imac


xrandr --output HDMI2 --auto --brightness 0.7 &
#                xrandr --output $monitor2 --auto --output $monitor1 --off;;

#dunst > /dev/null 2>&1 &
xbindkeys &
#xidle &
#xscreensaver -nosplash &
numlockx &

#################################
#export WMAKER_USER_ROOT=/home/brock/GNUstep/ 
#xrdb -merge ~/.Xresources &
#~/.fehbg &
#sxhkd -c $HOME/.config/wmaker/sxhkdrc &
#conky -c $HOME/.config/conky/conkye15.conf &
#/home/brock/bin/conkystart.sh &
#exec wmaker --no-clip --no-dock
#########################################
#################################
export WMAKER_USER_ROOT=/home/brock/data/GNUstep/ 
xrdb -merge ~/data/.Xresources &
~/.fehbg &
sxhkd -c $HOME/data/.config/wmaker/sxhkdrc &
conky -c $HOME/data/.config/conky/conkye15.conf &
#/home/brock/bin/conkystart.sh &
exec wmaker --no-clip --no-dock
#########################################

####openbox#######################################
#xset s 1800 1800 &
#sleep 1
#xrdb -merge ~/data/.Xresources &
#sxhkd -c $HOME/data/.config/wmaker/sxhkdrc &
#exec /usr/bin/openbox-session
##################################################

###############################
#exec /usr/bin/xfce-terminal &
#exec /usr/bin/sawfish
###############################

#sleep 1

######################################################
#xrdb -merge ~/.Xresources &
#sxhkd -c $HOME/.config/berry/sxhkdrc &
#exec /usr/local/bin/berry -c ~/.config/berry/autostart
######################################################

######################################################
#sxhkd -c $HOME/.config/katriawm/sxhkdrc &
#exec /usr/local/bin/katriawm -c ~/.config/katriawm/autostart
######################################################

#################################
#exec /usr/bin/evilwm &
#/home/brock/bin/conkystart.sh
#################################

#exec /usr/bin/mwm
#exec /usr/bin/jwm

#########################################
#xrdb -merge ~/.Xresources &
#sxhkd -c $HOME/.config/wmaker/sxhkdrc &
#conky -c $HOME/.config/conky/conkythinkpad.conf &
#/usr/bin/xfce4-terminal &
#exec /usr/bin/openbsd-cwm                 #https://undeadly.org/cgi?action=article&sid=20090502141551


#dmenu &
#exec /usr/bin/xfce-terminal &
#exec /usr/bin/blackbox

#exec /usr/bin/xfce-terminal &
#exec /usr/bin/startfluxbox

#https://github.com/addy-dclxvi/xfwm4-standalone https://wiki.archlinux.org/index.php/Xfwm
#https://forum.xfce.org/viewtopic.php?id=6841
#exec /usr/bin/xfwm4 

#exec /usr/bin/pekwm

#########################################
#sxhkd -c $HOME/.config/wmaker/sxhkdrc &
#export XDG_CURRENT_DESKTOP=Budgie:GNOME 
#exec budgie-desktop
#########################################



#exec /usr/bin/tinywm
#exec /usr/bin/icewm


#exec /usr/bin/ratpoison ## "C-t :quit" to quit ratpoison
#exec /home/brock/bin/conkystart.sh &
#exec /home/brock/bin/xflux -z 11109 &



#xfce4-terminal &
#exec /usr/bin/kwin_x11
#systemctl gdm3 stop
#https://unix.stackexchange.com/questions/8056/disable-screen-blanking-on-text-console
####systemctl disable lightdm.service
####systemctl enable lightdm.service
######################3https://github.com/nullgemm/ly


#exec plasma-desktop
#exec plasma_session
#I think you need to ask systemd to start it. It would go something like:
#systemctl enable kdm
#or
#systemctl enable kdm.service
#and then, with whichever works, do:
#systemctl start kdm
