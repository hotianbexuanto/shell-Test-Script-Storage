#!/bin/bash

# ANSI颜色码
RED="\033[01;31m"
BLUE="\033[01;34m"
GREEN="\033[01;32m"
RESET="\033[0m"

# 颜色循环数组
colors=("$RED" "$BLUE" "$GREEN")
color_index=0

# 显示正方形字符串UI框的函数
function show_square_ui_box() {
    local title="$1"
    local message="$2"

    # 获取终端的宽度，设置默认宽度为50，如果tput不可用
    local terminal_width=$(tput cols 2>/dev/null || echo 50)

    # 计算字符串的长度
    local title_len=${#title}
    local message_len=${#message}
    local max_content_len=$(( title_len > message_len ? title_len : message_len ))

    # 设置正方形框的边长，确保宽度不超过终端宽度
    local side_length=$(( max_content_len + 12 ))
    if (( side_length > terminal_width )); then
        side_length=$terminal_width
    fi

    # 打印上边框
    printf "\n%s\n" "$(printf '%*s' "$side_length" '' | tr ' ' '-')"

    # 打印空白行以居中标题和消息
    local padding_lines=$(( (side_length - 3) / 2 ))
    for (( i=0; i<padding_lines; i++ )); do
        printf "|%*s|\n" "$((side_length-2))" ""
    done

    # 打印居中的标题
    local title_padding=$(( (side_length - title_len - 2) / 2 ))
    printf "|%*s%s%s%*s|\n" "$title_padding" "" "${colors[color_index]}$title${RESET}" "$((side_length - title_len - title_padding - 2))" ""

    # 更新颜色索引
    color_index=$(( (color_index + 1) % 3 ))

    # 打印分隔符行
    printf "|%*s|\n" "$((side_length-2))" "$(printf '%*s' '' | tr ' ' '-')"

    # 打印居中的消息
    local message_padding=$(( (side_length - message_len - 2) / 2 ))
    printf "|%*s%s%s%*s|\n" "$message_padding" "" "${colors[color_index]}$message${RESET}" "$((side_length - message_len - message_padding - 2))" ""

    # 更新颜色索引
    color_index=$(( (color_index + 1) % 3 ))

    # 打印空白行以居中标题和消息
    for (( i=0; i<padding_lines; i++ )); do
        printf "|%*s|\n" "$((side_length-2))" ""
    done

    # 打印下边框
    printf "%s\n" "$(printf '%*s' "$side_length" '' | tr ' ' '-')"
}

# 调用UI框函数，展示一个正方形的框，红蓝绿颜色循环显示
show_square_ui_box "欢迎使用脚本" "请输入以下信息: "

# 继续脚本的其他部分...