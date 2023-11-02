#!/usr/bin/env bash
# 配置 MinGW 环境的文件

pacman -Syu
pacman -S gcc g++ nano git

# fish 配置
pacman -S fish
# 切换默认 shell
sed -i /c/msys64/msys2_shell.cmd -e 's/set "LOGINSHELL=bash"/set "LOGINSHELL=fish"/'
fish ./configure_fish.fish