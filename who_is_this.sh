#!/bin/bash
_who="/usr/bin/zenity"
_outputput="/tmp/whois.outputput.$$"
domain=$(${_who} --title  "Enter domain" \
	            --entry --text "Enter the domain you would like to see whois info" )
 
if [ $? -eq 0 ]
then
 
  whois $domain  | tee >(${_who} --width=200 --height=100 \
  				    --title="whois" --progress \
			            --pulsate --text="Searching domain info..." \
                                    --auto-kill --auto-close \
                                    --percentage=10) >${_output}
 
 
  ${_who} --width=900 --height=700  \
	     --title "Whois info for: $domain" \
	     --text-info --filename="${_output}"
else
  ${_who} --error \
	     --text="Please provide input"
fi