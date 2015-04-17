#!/bin/bash
# Autor: Elvis Pompeu
# Consultor Linux
# 4Linux - Open Software Specialists

BACULARESUL=$(echo "list job=$1" | /sbin/bconsole | cut -d'|' -f9 | grep "^ [A-Z]" |  sed 1d | tail -n1 | sed 's/ //')

if [[ ${BACULARESUL} == *T* ]] || [[ ${BACULARESUL} == *R* ]] || [[ ${BACULARESUL} == *C* ]]; then

        echo "0"

else

        echo "1"

fi
