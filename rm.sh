#!/bin/bash

### copy from http://www.jjmoo.com/blog/linux/shell/alias-rm-to-script.html

# 设置回收路径
trashPath=$HOME/.MyTrash

# 设置保存时间,2592000为30天
period=2592000

# 创建回收文件夹
if [ ! -d "$trashPath"  ]; then
    mkdir $trashPath
fi

# 清除命令中的所有开关选项
args=${@##-*}

# 根据当前时间新建临时文件夹
dest=$trashPath/`date "+%Y-%m-%d_%H:%M:%S_%s"`/
if [ ! -d "$dest"  ]; then
    mkdir $dest
fi

# 移动文件，如有必要，修改错误信息并输出
msg=`mv $args "$dest" 2>&1`
if [ ! "$msg" = ""  ]; then
    echo ${msg//mv/my_rm}  # 将错误信息中的“mv”替换成"my_rm"
fi

# ======================================
# 每天第一次使用这个命令后，清理一段时间以前回收的文件
# ------------------------------
# 定义清理旧文件的函数
function clearOldFile()
{
    echo "delete old file, please wait ..."

    now=`date "+%s"`
    for folder in `ls $trashPath`
    do
        folderTime=${folder##*_}  # 获取文件名中“_”后的数字
        gap=`expr $now - $folderTime`
        # echo $folder    $gap
        if [ $gap -gt $period  ]; then
            # echo rm $trashPath/$folder
            /bin/rm -rf $trashPath/$folder  # 删除$period之前的文件夹
        fi
    done
}
# ------------------------------
# 设置标志文件路径
flagFile=$trashPath/.flag

today=`date "+%d"`
if [ -f "$flagFile"  ]; then
    lastTime=`cat $flagFile`  # 读取标志文件中的日期
    if [ "$lastTime" -ne "$today"  ]; then  # 如果不是今天的日期就清理
        clearOldFile
    fi
else  # 标志文件不存在也要清理
    clearOldFile
fi
echo $today > $flagFile  # 输出今天的日期到标志文件
# =====================================
