#!/bin/bash

#checking sleep time
SLEEP_TIME="600"

#actions
ACTION="lxterminal -x sudo shutdown -h now"

#helping variables
INFO_20=0;
INFO_25=0;
INFO_10=0;

while [ true ]; do

  STAT=$(acpi -b | awk '{print $3}' | awk 'sub(".$", "")')
  BATT=$(acpi -b | awk '{print $4}' | awk 'sub("..$", "")')
 
 #echo $STAT
 
# >>>>> THIS condition is not working <<<<<<
  if [[ $STAT=="Discharging" ]]; then

    if (( $BATT<"5"));
      then
        gxmessage -center -title 'Battery under 5%' -buttons yes:0,no:2 -default no 'Computer battery is under 5%. Do you want to shutdown?' -fg red && $($ACTION);
    elif (( $BATT<"7"));
      then
        gxmessage -center -title 'Battery under 7%' -buttons ok:0 -default ok 'Computer battery is under 7%...';
        INFO_10=0;
    elif (( $BATT<"10" && $INFO_10==0 ));
      then
        gxmessage -center -title 'Battery under 10%' -buttons ok:0 -default ok 'Computer battery is under 10%...';
        INFO_10=1;
        INFO_20=0;
    elif (( $BATT<"20" && $INFO_20==0 ));
      then
        gxmessage -center -title 'Battery under 15%' -buttons ok:0 -default ok 'Computer battery is under 15%...';
        INFO_20=1;
    fi
  fi

  sleep $SLEEP_TIME
done
    
