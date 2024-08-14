#!/bin/bash

# 显示长方形字符串UI框的函数
function show_rectangle_ui_box() {
    local title="$1"
    local message="$2"

    # 设置边框宽度为固定宽度（如50）
    local box_width=50

    # 计算标题和消息的填充宽度（考虑边框本身的宽度）
    local title_padding=$(( (box_width - ${#title} - 2) / 2 ))
    local message_padding=$(( (box_width - ${#message} - 2) / 2 ))

    # 打印上边框
    printf "%s\n" "$(printf '%*s' "$box_width" '' | tr ' ' '-')"

    # 打印空白行以增加高度（顶部空白行）
    for (( i=0; i<3; i++ )); do
        printf "|%*s|\n" "$((box_width-2))" ""
    done

    # 打印居中的标题
    printf "|%*s%s%*s|\n" "$title_padding" "" "$title" "$((box_width - 2 - ${#title} - title_padding))" ""

    # 打印空白行以增加高度（中间空白行）
    printf "|%*s|\n" "$((box_width-2))" ""

    # 打印居中的消息
    printf "|%*s%s%*s|\n" "$message_padding" "" "$message" "$((box_width - 2 - ${#message} - message_padding))" ""

    # 打印空白行以增加高度（底部空白行）
    for (( i=0; i<3; i++ )); do
        printf "|%*s|\n" "$((box_width-2))" ""
    done

    # 打印下边框
    printf "%s\n" "$(printf '%*s' "$box_width" '' | tr ' ' '-')"
}

# 调用UI框函数，展示一个长方形的框
show_rectangle_ui_box "欢迎使用脚本" "请输入以下信息: "

# 继续脚本的其他部分...