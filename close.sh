#!/bin/bash

#自动关停所有子进程

piddir='./piddir/'
expidfile=${piddir}ex.pid
closepid=${piddir}close.pid
closefile=${piddir}closefile

mainname='111.sh'

for (( i = 1; i > 0; i++ )); do
    ps -ef | grep ${mainname} | grep -v grep
    if [[ ${?} -ne 0 ]]; then
        cd ${piddir}
        echo -n `cat ex.pid*` > ${closefile}
        kill -9 `cat ${closefile}`
    fi
    sleep 10
done