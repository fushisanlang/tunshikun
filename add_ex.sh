#!/bin/bash

#用来后台计算经验，自动增加经验,自动升级

#定义数据文件
datadir='./datadir/'
experiencefile=${datadir}experience.file
attributefile=${datadir}attribute.file
levelfile=${datadir}level.file

piddir='./piddir/'
expidfile=${piddir}ex.pid

getlv () {
    cat ${levelfile}
}
setlv () {
    echo ${1} > ${levelfile} 
}
getex () {
    cat ${experiencefile}
}
setex () {
    echo ${1} > ${experiencefile} 
}



addex () {
    oldex=`get_ex`
    if [[ ${oldex} -eq 99 ]]; then
        setex 0
        oldlv=`get_lv`
        let newlv=${oldlv}+1
        setlv ${newlv}
    else
        let newex=${oldex}+1
        setex ${newex}
    fi
}

main () {
for (( i = 1; i > 0; i++ )); do
    addex
    sleep 1
done
}

echo ${$} > ${expidfile}
main