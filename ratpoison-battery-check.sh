
#!/bin/bash -x
# Free software provided to you from the \\Quantifier\\Consortium\\. No warranty and the risks are all yours
# https://github.com/royaleconqueso
# This script monitors battery life, gives ratpoison alerts as it goes down, and then at 7% a gxmessage, and then at 5% shuts down
# you may need to edit the STAT and BATT fields for your own acpi output. You may also need to install acpi


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
SLEEP_TIME="300"

#actions
#ACTION="shutdown -h now"

#helping variables
while [ true ]; do

STAT=$(acpi -b | tail -1 | awk '{print $3}' | awk 'sub(".$", "")' | head -1)
  #BATT=$(acpi -b | tail -1 | awk '{print $4}' | awk 'sub(".$", "")' | sed 's/.$//' | head -1)
BATT=$(acpi -b | awk '{print $4}' | sed 's/%//' | sed 's/,//')

    if (($BATT<"20"));
      then
        ratpoison -c "echo `acpi -b | tail -1 | awk '{print $4}' | awk 'sub(".$", "")' | sed 's/.$//' | head -1` percent battery life";
    fi

  sleep $SLEEP_TIME
done
