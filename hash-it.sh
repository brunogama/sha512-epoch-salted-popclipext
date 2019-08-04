#!/bin/bash
#  "THE BEER-WARE LICENSE" (Revision 42):
#  <@brunogama> wrote this file.  As long as you retain this notice you
#  can do whatever you want with this stuff. If we meet some day, and you think
#  this stuff is worth it, you can buy me a beer in return.   Bruno Gama

__POP_OUTPUT= "$POPCLIP_TEXT" 
for i in $(seq 1 5); do
  __SALT=$(/bin/echo -n $(date +%s) | /usr/bin/openssl dgst -sha512 | awk '{print $1}')
  __POP_OUTPUT=$(/bin/echo -n "${__POP_OUTPUT} ${__SALT}" | /usr/bin/openssl dgst -sha512)
done

echo $__POP_OUTPUT | awk '{print $1}'
unset __POP_OUTPUT __SALT