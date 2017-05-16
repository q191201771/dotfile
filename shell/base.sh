#!/usr/bin/env bash
# @file   base.sh
# @author
#   chef <191201771@qq.com>
#     -created 2017-05-16 20:23:34
#     -initial release xxxx-xx-xx
# @brief
#   xxx

### 演示脚本传参
usage() {
    echo "Usage: $0 <from> <to>"
}

[ $# != 2 ] && {
    usage
    exit 1
}

from=$1
to=$2

### 定义变量
name="unknown"
### 重新赋值
name="chef"
### 使用变量
echo "name:${name}"

for ((i=0; i<4; i++)); do
    echo "index: ${i}"
done

for ((; ; )); do
    echo 'test break'
    break
done

### if
if [[ ${name} == 'chef11' ]]; then
    echo "hit if"
    echo "hit if"
elif [[ ${name} == 'chef' ]]; then
    echo 'hit elif'
    echo 'hit elif'
else
    echo 'hit else'
    echo 'hit else'
fi

### 字符串转义
str="'\""
echo ${str}
### 字符串拼接
echo "hello ${name}!"
### 字符串长度
echo "length of '${name}' is ${#name}."
### 提取子串
str="hello world"
echo ${str:1:4}

### 控制台输出颜色
CONSOLE_GREEN="echo -en \\033[0;32m"
CONSOLE_YELLOW="echo -en \\033[0;33m"
CONSOLE_RED="echo -en \\033[0;31m"
CONSOLE_NORMARL="echo -en \\033[0;39m"
$CONSOLE_RED
echo 'red'
$CONSOLE_NORMARL

date +'%Y%m%d %H:%M:%S'
bt=`date +%s`
### 打印不换行
echo -n "sleeping @${bt}..."
#sleep 1
et=`date +%s`
echo " [ done @${et}]"
### 运算
echo "duration:$[et-bt]"

### 运行参数相关
### $0 脚本自身 ./base.sh 或者 base.sh
### $1 第一个参数，后面的依次类推$2 $3...
### $# 参数个数，没参数则为0
echo "$0 $#"

### 文件、文件夹是否存在
### -e 文件或文件夹 -d 文件夹
if [ -e '/home' ]; then
    if [ -d '/home' ]; then
        echo '/home is dir.'
    else
        echo '/home is file.'
    fi
else
    echo '/home not exist!'
fi

### 遍历文件夹
for item in /*; do
    echo $item
done

### 函数
function just_add() {
    ### 第一个参数，第二个参数
    return $[$1+$2]
}
just_add 10 20
### 获取结果
echo $?
