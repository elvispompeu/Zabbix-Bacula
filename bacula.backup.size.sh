#!/bin/bash
# Autor: Elvis Pompeu
# Consultor Linux
# 4Linux - Open Software Specialists

case $1 in

        incremental) INCREMENTAL=$(echo "list job=$2" | /sbin/bconsole | cut -d"|" -f6,8 | sed 's/ //g' | grep "I" | grep -v "bacula-dir" | sed 's/I|//g' | sed 's/,//g' | tail -n1 | grep -v "[a-z][A-Z]")

        if [ -z "$INCREMENTAL" ]; then

                echo "0"

        else

                echo "$INCREMENTAL"

        fi

        ;;

        diferencial) DIFERENCIAL=$(echo "list job=$2" | /sbin/bconsole | cut -d"|" -f6,8 | sed 's/ //g' | grep "D" | grep -v "bacula-dir" | sed 's/D|//g' | sed 's/,//g' | tail -n1 | grep -v "[a-z][A-Z]")

        if [ -z "$DIFERENCIAL" ]; then

                echo "0"

        else

                echo "$DIFERENCIAL"

        fi

        ;;

        full) FULL=$(echo "list job=$2" | /sbin/bconsole | cut -d"|" -f6,8 | sed 's/ //g' | grep "F" | grep -v "bacula-dir" | sed 's/F|//g' | sed 's/,//g' | tail -n1 | grep -v "[a-z][A-Z]")


        if [ -z "$FULL" ]; then

                  echo "0"
                
                else

                  echo "$FULL"    

        fi

        ;;

        *) echo -e "Não existe essa opção!"

esac
