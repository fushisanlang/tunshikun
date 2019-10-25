get_random () {
    A=`date +%s`
    expr ${A} % ${1}
}

get_enemy () {
    echo 
}
#安装依赖
install_lib () {
    #输出
    yum install stty figlet
    #输出
}

#检查窗口大小
get_ttysize () {
    tty_h=`stty size| awk '{print $1}'`
    tty_w=`stty size| awk '{print $2}'`
    if [[ ${tty_h} -lt 30  ]]; then
        echo_red "your tty_h is too low.i need more then 30."
        echo_red "use \`stty size| awk '{print $1}'\` to get your tty_h."
        exit 1
    fi
    if [[ ${tty_w} -lt 100 ]]; then
        echo_red "your tty_w is too low.i need more then 100."
        echo_red "use \`stty size| awk '{print $2}'\` to get your tty_w."
        exit 1        
    fi
}