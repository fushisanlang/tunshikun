#！/bin/bash
datafile='./datafile'


function use_func () {
    sh ./222.sh ${1}
}


function main () {
	use_func install_lib
    > ${datafile}
    use_func get_ttysize
    use_func start_page
#    select_lanage
    use_func stage_1
}

main


