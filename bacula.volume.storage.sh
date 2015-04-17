#!/bin/bash
# Autor: Elvis Pompeu
# Consultor Linux
# 4Linux - Open Software Specialists


BACULARESUL=$(echo "status director" | /sbin/bconsole | grep $1 | grep -i "is waiting on Storage" | wc -l)

if [ ${BACULARESUL} -eq 0 ]; then

        echo "0"

else

        echo "1"

fi
