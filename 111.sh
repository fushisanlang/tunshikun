#！/bin/bash
datafile='./datafile'
funcfile='./222.sh'

function use_func () {
    sh ${funcfile} ${1}
}


function main () {
	#use_func install_lib
    > ${datafile}
    use_func get_ttysize
    use_func start_page
#    select_lanage
    use_func stage_1
}

main


