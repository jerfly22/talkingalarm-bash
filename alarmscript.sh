#code for Alarm
#!/bin/bash
WEA=$(weather-util -m CYND | grep Temperature | cut -c16-19)
SKY=$(weather-util -m CYND | grep Sky | cut -c19-35)
GCAL=$(gcalcli agenda 12:00am 11:59pm --nocolor)
ITEMS=$(gcalcli agenda 12:00am 11:59pm --nocolor | wc -l)
BSTD="No Events Found..."

if [[ $GCAL = *"$BSTD"* ]]
then
	AGENDA=0
else
#this is done since gcalcli writes two blank lines for shiggles
	AGENDA=$(calc $ITEMS-2)
fi

sleep 30

#writing to fields as festival sounds more natural in this state.

if [ $AGENDA -eq 1 ]
then
  echo "There is $AGENDA item on your agenda today." > agenda.txt
elif [ $AGENDA -gt 1 ]
then
  echo "There are $AGENDA items on your agenda today." > agenda.txt
else
   echo "There are no items on your agenda today." > agenda.txt

fi

echo "The weather in Ottawa is $WEA degrees with $SKY skies" > weather.txt
echo "Good Morning," | festival --tts

echo "The time is $HR $MIN" | festival --tts



# Set up a variable to hold the current minute
# of the hour using the date command:
MIN=$(date +"%M")

# And another to hold the current Hour:
HR=$(date +"%l")

# Use a case statement to change the minute
# number to the equivalent word, but make the
# zero minute "o'clock". Handle all sixty minutes
# of the hour so this works correctly for any time.

case $MIN in
"00") MIN="o'clock";;
"01") MIN="Oh - one";;
"02") MIN="Oh - two";;
"03") MIN="Oh - three";;
"04") MIN="Oh - four";;
"05") MIN="Oh - five";;
"06") MIN="Oh - six";;
"07") MIN="Oh - seven";;
"08") MIN="Oh - eight";;
"09") MIN="Oh - nine";;
"10") MIN="ten";;
"11") MIN="eleven";;
"12") MIN="twelve";;
"13") MIN="thirteen";;
"14") MIN="fourteen";;
"15") MIN="fifteen";;
"16") MIN="sixteen";;
"17") MIN="seventeen";;
"18") MIN="eighteen";;
"19") MIN="nineteen";;
"20") MIN="twenty";;
"21") MIN="twenty one";;
"22") MIN="twenty two";;
"23") MIN="twenty three";;
"24") MIN="twenty four";;
"25") MIN="twenty five";;
"26") MIN="twenty six";;
"27") MIN="twenty seven";;
"28") MIN="twenty eight";;
"29") MIN="twenty nine";;
"30") MIN="thirty";;
"31") MIN="thirty one";;
"32") MIN="thirty two";;
"33") MIN="thirty three";;
"34") MIN="thirty four";;
"35") MIN="thirty five";;
"36") MIN="thirty six";;
"37") MIN="thirty seven";;
"38") MIN="thirty eight";;
"39") MIN="thirty nine";;
"40") MIN="forty";;
"41") MIN="forty one";;
"42") MIN="forty two";;
"43") MIN="forty three";;
"44") MIN="forty four";;
"45") MIN="forty five";;
"46") MIN="forty six";;
"47") MIN="forty seven";;
"48") MIN="forty eight";;
"49") MIN="forty nine";;
"50") MIN="fifty";;
"51") MIN="fifty one";;
"52") MIN="fifty two";;
"53") MIN="fifty three";;
"54") MIN="fifty four";;
"55") MIN="fifty five";;
"56") MIN="fifty six";;
"57") MIN="fifty seven";;
"58") MIN="fifty eight";;
"59") MIN="fifty nine";;
*) echo "error with minute $MIN" | festival --tts;;
esac

# Use another case statement to do the following:
# Use the echo command to assemble the output
# text for the current time statement, change the
# number for the current hour to the equivalent
# word, and pipe the result to festival.

case $HR in
" 1") echo $INTRO "one, $MIN" | festival --tts;;
" 2") echo $INTRO "two, $MIN" | festival --tts;;
" 3") echo $INTRO "three, $MIN" | festival --tts;;
" 4") echo $INTRO "four, $MIN" | festival --tts;;
" 5") echo $INTRO "five, $MIN" | festival --tts;;
" 6") echo $INTRO "six, $MIN" | festival --tts;;
" 7") echo $INTRO "seven, $MIN" | festival --tts;;
" 8") echo $INTRO "eight, $MIN" | festival --tts;;
" 9") echo $INTRO "nine, $MIN" | festival --tts;;
"10") echo $INTRO "ten, $MIN" | festival --tts;;
"11") echo $INTRO "eleven, $MIN" | festival --tts;;
"12") echo $INTRO "twelve, $MIN" | festival --tts;;
*) echo "error with hour $HR and minute $MIN" | festival --tts;;
esac



sleep 1

festival --tts weather.txt
sleep 1
festival --tts agenda.txt

exit




