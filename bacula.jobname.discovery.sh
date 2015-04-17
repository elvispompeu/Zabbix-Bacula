#!/bin/sh                                                                  
# Autor: Elvis Pompeu
# Consultor Linux
# 4Linux - Open Software Specialists

# Begin
for job in $(echo "show jobs" | /sbin/bconsole | grep -i "job: name=" | cut -d'=' -f2 | awk '{print $1}'); do
        # Aramzena o valor no ARRAY.
        jobname="$jobname,"'{"{#JOBNAME}":"'$job'"}'
done
        echo '{"data":['${jobname#,}' ]}'
