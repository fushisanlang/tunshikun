#！/bin/bash
datafile='./datafile'

#定义数据文件
datadir='./datadir/'
experiencefile=${datadir}experience.file
attributefile=${datadir}attribute.file
levelfile=${datadir}level.file


addexfile='./add_ex.sh'


piddir='./piddir/'
expidfile=${piddir}ex.pid

mkdir -p ${datadir} ${piddir}

#定义属性数组
E=('亢金龙' '角木蛟' '箕水豹' '房日兔' '心月狐' '尾火虎' '氐土貉')
S=('鬼金羊' '井木犴' '轸水蚓' '星日马' '张月鹿' '翼火蛇' '柳土獐')
W=('娄金狗' '奎木狼' '参水猿' '昴日鸡' '毕月乌' '嘴火猴' '胃土雉')
N=('牛金牛' '斗木獬' '壁水貐' '虚日鼠' '危月燕' '室火猪' '女土蝠')


#定义输出颜色
echo_red () {
    echo -e "\033[0;31m ${1} \033[0m"
}
echo_green () {
    echo -e "\033[0;32m ${1} \033[0m"
}
echo_yellow () {
    echo -e "\033[0;33m ${1} \033[0m"
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

start_page () {
    clear
    echo -e "\033[33;33;5m"
    figlet 'tunshi  KUN'
    echo -e "\033[0m "
    echo ''
    echo ''
    echo ''
    echo '                version 0.1'
    echo '               power by fu13'
    echo '                '
    echo '                '
    echo '                '
    echo '            push enter to start'
    read null

}

select_lanage () {
    clear
    echo '1. English'
    echo '2. 中文'
    echo ''
    echo '暂时只有中文。其他语言，八成永远不会推出。。。'
    sleep 3
}

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

get_new_kun () {
    let NUM=${2}-1
    case $1 in
        1 )
        echo "AT E ${NUM}" > ${datafile} && echo ${E[${NUM}]} ;;
        2 )
        echo "AT S ${NUM}" > ${datafile} && echo ${S[${NUM}]} ;;
        3 )
        echo "AT W ${NUM}" > ${datafile} && echo ${W[${NUM}]} ;;
        4 )
        echo "AT N ${NUM}" > ${datafile} && echo ${N[${NUM}]} ;;
    esac
}

stage_1 () {
    clear
    echo '你现在有一颗鲲蛋，你想在什么地方孵化？'
    echo '1.东胜神洲'
    echo '2.南赡部洲'
    echo '3.西牛贺洲'
    echo '4.北俱芦洲'
    read direction
    case ${direction} in
        1|2|3|4 )
         clear   ;;
        * )
        echo_red '输入位置不存在，鲲蛋已进入异次元。请少侠从头来过。。。' && exit 1
    esac
    echo '现在你面前有五个法宝，选择其中一个给幼鲲吞噬：'
    echo '1. 金蛟剪' 
    echo '2. 桃木杖' 
    echo '3. 定海珠' 
    echo '4. 九龙神火罩' 
    echo '5. 清净琉璃瓶'
    echo '6. 火龙标'
    echo '7. 劈地珠' 
    read treasure
    case ${treasure} in
    1|2|3|4|5|6|7 )
     clear   ;;
    * )
    echo_red '投喂了位置物品，幼鲲死亡。请少侠从头来过。。。' && exit 1
    esac
    echo "恭喜少侠喜提新鲲，初始属性为`get_new_kun ${direction} ${treasure}`"
    setex 0
    setlv 0
    echo "少侠的鲲目前是lv.`getlv`, `getex`%经验。"
    echo '开始吞噬之路吧.'

}
get_info () {
    clear
    echo '采用五行相生相克的思路。'
    echo '日为特殊火属性，被木生，不被水克。月为特殊水属性，被金生，不被土克。'
    echo '吞噬中，被生方胜率 +30%，被克方胜率 -30%。每高出对手1级，胜率加3%。如果现在打不过对手，请多多修炼。'
    echo '吞噬之前，需要在你的属性中选择一项。'
    echo '你只能看见胜率，无法看见对方任何属性。'
    echo '你可以选择是否吞噬对方。'
    echo '吞噬胜利，可以获得对方50%的经验,并获取对方属性。如果已有该条属性，转化为直升1级。'
    echo '吞噬失败，可以选择掉级或丧失1条属性。'  
}

get_random () {
    A=`date +%s`
    expr ${A} % ${1}
}

get_enemy () {
    echo 
}

print_stage () {
    clear
    echo "现在是北京时间` date +%F\ %H:%M:%S`."
    echo "少侠的鲲目前是lv.`getlv`, `getex`%经验。"
    sleep 1
}




main () {
    sh ${addexfile} &
    > ${datafile}
    get_ttysize
    start_page
#    select_lanage
    stage_1
    for (( i = 2; i > 1; i++ )); do
        print_stage
    done
    
}

main


