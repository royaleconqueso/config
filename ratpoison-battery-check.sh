
#!/bin/bash -x
# Free software provided to you from the \\Quantifier\\Consortium\\. No warranty and the risks are all yours
# https://github.com/royaleconqueso
# This script monitors battery life, gives ratpoison alerts as it goes down, and then at 7% a gxmessage, and then at 5% shuts down
# you may need to edit the STAT and BATT fields for your own acpi output. You may also need to install acpi

if ! [ -x "$(command -v gxmessage)" ]; then
 clear;
  echo " **********************************************************************************************************" >&2
  echo " ** Oh, no! This script requires that you have gxmessage installed and available in your path.            *" >&2
  echo " ** You should either install gxmessage, or edit the script to include your preferred notification app.   *" >&2
  echo " ** Exiting...                                                                                            *" >&2
  echo " **********************************************************************************************************" >&2
  exit 1
fi

if ! [ -x "$(command -v acpi)" ]; then
 clear;
  echo " **********************************************************************************************************" >&2
  echo " ** Oh, no! This script requires that you have acpi installed and available in your path.                 *" >&2
  echo " ** But you don't.                                                                                        *" >&2
  echo " ** Exiting...                                                                                            *" >&2
  echo " **********************************************************************************************************" >&2
  exit 1
fi

#checking sleep time
SLEEP_TIME="600"

#actions
ACTION="shutdown -h now"

#helping variables
INFO_75=0;
INFO_50=0;
INFO_25=0;
INFO_10=0;

while [ true ]; do

  STAT=$(acpi -b | tail -1 | awk '{print $3}' | awk 'sub(".$", "")' | head -1)
  BATT=$(acpi -b | tail -1 | awk '{print $4}' | awk 'sub(".$", "")' | sed 's/.$//' | head -1)
 
 #echo $STAT
 
# >>>>> THIS condition is not working <<<<<<
#  if [[ $STAT=="Discharging" ]]; then

    if (($BATT<"5"));
      then
        gxmessage -bg red -center -title '5% battery? Fuuuuuuccccckkkkk!' -buttons yes:0,no:2 -default no '5% battery? Fuuuuuuccccckkkkk!' -fg red && sleep 15 && $($ACTION);
    elif (( $BATT<"10" && $INFO_10==0 ));
      then
        gxmessage -bg green -center -title 'Oh, Shit! Battery under 10%' -buttons ok:0 -default ok 'Oh, Shit! Battery under 10%...';
        INFO_10=1;
        INFO_25=1;
        INFO_50=1;
        INFO_75=1;
    elif (( $BATT<"25" && $INFO_25==0 ));
      then
        ratpoison -c "echo `acpi -b | tail -1 | awk '{print $4}' | awk 'sub(".$", "")' | sed 's/.$//' | head -1` percent battery life";
        INFO_25=1;
        INFO_50=1;
        INFO_75=1;
    elif (( $BATT<"50" && $INFO_50==0 ));
      then
        ratpoison -c "echo `acpi -b | tail -1 | awk '{print $4}' | awk 'sub(".$", "")' | sed 's/.$//' | head -1` percent battery life";
        INFO_50=1;
        INFO_75=1;
    elif (( $BATT<"75" && $INFO_75==0 ));
      then
        ratpoison -c "echo `acpi -b | tail -1 | awk '{print $4}' | awk 'sub(".$", "")' | sed 's/.$//' | head -1` percent battery life";
        INFO_75=1;
    fi
 # fi

  sleep $SLEEP_TIME
done
