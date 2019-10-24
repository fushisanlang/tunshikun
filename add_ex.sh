#!/bin/bash

#用来后台计算经验，自动增加经验,自动升级

function use_func () {
    sh ./222.sh ${1}
}

piddir='./piddir/'
Expidfile=${piddir}Ex.pid

function add_ex () {
    OLDex=`use_func get_ex`
    if [[ ${OLDex} -eq 99 ]]; then
        use_func setex 0
        OLDlv=`use_func get_lv`
        let NEWlv=${OLDlv}+1
        use_func setlv ${NEWlv}
    else
        let NEWex=${OLDex}+1
        use_func setex ${NEWex}
    fi
}

function main () {
for (( i = 1; i > 0; i++ )); do
    add_ex
    sleep 1
done
}

echo ${$} > ${Expidfile}
main