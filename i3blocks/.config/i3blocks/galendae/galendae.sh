#!/bin/bash
 
if [[ "${BLOCK_BUTTON}" -eq 1 ]];
then
	galendae
fi
 
FORMAT="${BLOCK_INSTANCE:-%a %d %b %Y}"
DATETIME=$(date "+${FORMAT}")
 
echo "${DATETIME}"
