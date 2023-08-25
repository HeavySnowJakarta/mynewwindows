# 假定你在新版 Powershell 环境下运行程序。Windows Terminal 将不再安装。
# 代理环境请自行配置。本脚本不管。
# 假定 echo 别名可用。

# 配置性变量

# 当前用户下载内容保存的位置
# 自行修改默认下载文件夹的位置，因为我不会命令行改法
# $download_path = "D:\Downloads" 
$vs_version = 2022 # Visual Studio 的版本

echo "请确保以管理员身份运行此脚本！"
if (([Security.Principal.WindowsPrincipal] `  [Security.Principal.WindowsIdentity]::GetCurrent() `
).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)){
    echo "是管理员身份！"
}
else{
    echo "不是管理员身份！"
    exit(1)
}

# 更新 winget 源
winget source reset --force
winget update
winget upgrade

# 安装桌面软件
winget install --id Tencent.WeChat
winget install --id Tencent.QQ
winget install --id NetEase.CloudMusic
winget install --id Microsoft.VisualStudioCode

# winget install --id MiXXX.MiXXX # 打碟的，看用不用得上
# winget install --id Valve.Steam

# 安装商店软件
winget install --id 9PCKT2B7DZMW # Battery Percentage Icon

# 安装命令行工具
winget install --id GNU.Nano
winget install --id gerardog.gsudo
winget install --id GNU.Wget2
winget install --id Git.Git

# 技术环境搭建，其中函数定义在脚本底部
# 其中会用到前面下载好的东西，按理说 winget 已经配置好环境变量了，按理说管理员窗口刷新一遍也没问题，
# 要是出问题了找不到命令了就重新开一个管理员窗口重新跑一遍脚本
$env:PATH = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
# Install-VS # Visual Studio
# Install-MSYS # MSYS 2
function Install-VS {
    winget install --id "Microsoft.VisualStudio.${vs_version}.Community" --override "--passive --config .\.vsconfig"
}

function Install-MSYS {
    winget install --id MSYS2.MSYS2
}