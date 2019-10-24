#！/bin/bash
datafile='./datafile'
funcfile='./222.sh'


addexfile='./add_ex.sh'


piddir='./piddir/'
expidfile=${piddir}ex.pid

use_func () {
    sh ${funcfile} ${1}
}


main () {
	sh ${addexfile} &
    > ${datafile}
    use_func get_ttysize
    use_func start_page
#    select_lanage
    use_func stage_1
    use_func print_stage
}

main


