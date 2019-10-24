#!/bin/bash

#用来后台计算经验，自动增加经验,自动升级

funcfile='./222.sh'

use_func () {
    sh ${funcfile} ${1}
}

piddir='./piddir/'
expidfile=${piddir}ex.pid

add_ex () {
    oldex=`use_func get_ex`
    if [[ ${oldex} -eq 99 ]]; then
        use_func setex 0
        oldlv=`use_func get_lv`
        let newlv=${oldlv}+1
        use_func setlv ${newlv}
    else
        let newex=${oldex}+1
        use_func setex ${newex}
    fi
}

main () {
for (( i = 1; i > 0; i++ )); do
    add_ex
    sleep 1
done
}

echo ${$} > ${expidfile}
main