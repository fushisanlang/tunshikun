#!/bin/bash

#自动关停所有子进程

piddir='./piddir/'
expidfile=${piddir}ex.pid
closepidfile=${piddir}close.pid
closefile=${piddir}closefile

mainname='111.sh'
echo ${$} > ${closepidfile}
for (( i = 1; i > 0; i++ )); do
    ps -ef | grep ${mainname} | grep -v grep
    if [[ ${?} -ne 0 ]]; then
        echo -n `cat ${piddir}*` > ${closefile}
        kill -9 `cat ${closefile}`
    fi
    sleep 10
done