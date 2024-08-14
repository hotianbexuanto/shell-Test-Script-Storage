#!/bin/bash

# 显示字符串UI框的函数
function show_ui_box() {
    local title="$1"
    local message="$2"

    # 获取终端的宽度
    local terminal_width=$(tput cols)

    # 计算字符串的长度
    local title_len=${#title}
    local message_len=${#message}

    # 设置UI框的最小宽度，避免窗口过窄
    local min_width=30
    local padding=4

    # 计算框的宽度，至少为min_width，最多为终端宽度
    local width=$((message_len + padding))
    if (( width < title_len + padding )); then
        width=$((title_len + padding))
    fi
    if (( width < min_width )); then
        width=$min_width
    fi
    if (( width > terminal_width )); then
        width=$terminal_width
    fi

    # 打印上边框
    printf "\n%s\n" "$(printf '%*s' "$width" '' | tr ' ' '-')"

    # 打印标题
    printf "| %-${width}s |\n" "$title"

    # 打印分隔符
    printf "| %-${width}s |\n" "$(printf '%*s' '' | tr ' ' '-')"

    # 打印消息
    printf "| %-${width}s |\n" "$message"

    # 打印下边框
    printf "%s\n" "$(printf '%*s' "$width" '' | tr ' ' '-')"
}

# 调用UI框函数，展示一个适应终端宽度的框
show_ui_box "欢迎使用脚本" "请输入以下信息: "
