# 假定你在新版 Powershell 环境下运行程序。Windows Terminal 将不再安装。
# 代理环境请自行配置。本脚本不管。
# 假定 Write-Output 别名可用。

# 配置性变量

# 当前用户下载内容保存的位置
# 自行修改默认下载文件夹的位置，因为我不会命令行改法
# $download_path = "D:\Downloads" 
$vs_version = 2022 # Visual Studio 的版本

Write-Output "请确保以管理员身份运行此脚本！"
if (([Security.Principal.WindowsPrincipal] `  [Security.Principal.WindowsIdentity]::GetCurrent() `
).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)){
    Write-Output "是管理员身份！"
}
else{
    Write-Output "不是管理员身份！"
    exit(1)
}

# 更新 winget 源
winget source reset --force
winget update
winget upgrade

# 安装桌面软件
winget install --id Microsoft.VisualStudioCode
winget install --id Mozilla.Thunderbird
winget install --id voidtools.Everything
winget install --id GeoGebra.CalculatorSuite
winget install --id Oracle.VirtualBox
winget install --id Qalculate.Qalculate
winget install --id Zettlr.Zettlr

winget install --id Tencent.WeChat
winget install --id Tencent.QQ
winget install --id NetEase.CloudMusic
winget install --id Nutstore.Nutstore
winget install --id Appest.Dida
winget install --id Tencent.TencentMeeting
# winget install --id Baidu.BaiduNetdisk

# winget install --id MiXXX.MiXXX # 打碟的，看用不用得上
# winget install --id Valve.Steam

# 安装商店软件
winget install --id 9PCKT2B7DZMW # Battery Percentage Icon
winget install --id XPDP273C0XHQH2 # Adobe Accrobat Reader DC
winget install --id 9WZDNCRFHWQT # Drawboard PDF

# 安装命令行工具
winget install --id GNU.Nano
winget install --id gerardog.gsudo
winget install --id GNU.Wget2
# winget install --id Git.Git

# 技术环境搭建
# 其中会用到前面下载好的东西，按理说 winget 已经配置好环境变量了，按理说管理员窗口刷新一遍也没问题，
# 要是出问题了找不到命令了就重新开一个管理员窗口重新跑一遍脚本
$env:PATH = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

function Install-VS {
    winget install --id "Microsoft.VisualStudio.${vs_version}.Community" --override "--passive --config .\visual-studio\.vsconfig"
}

function Install-MSYS {
    winget install --id MSYS2.MSYS2
    Write-Output "MinGW 部署完成，接下来开始运行自动配置脚本。"
    C:\msys64\usr\bin\bash.exe .\configure_mingw.sh
}

function Install-NodeJS{
    winget install --id OpenJS.NodeJS
}

# Install-VS # Visual Studio
# Install-MSYS # MSYS 2
# Install-NodeJS # Node.JS, pnpm 和其他相关模块

# Powershell 美化部分
function beautifyPwsh{
    # 安装 oh-my-posh
    winget install --id JanDeDobbeleer.OhMyPosh
    # 安装字体
    sudo oh-my-posh font install CascadiaCode
    # 生成并配置 Powershell 配置文件
    New-Item -Path $PROFILE -Type File -Force
    Write-Output "oh-my-posh init pwsh --config $env:POSH_THEMES_PATH\zash.omp.json | Invoke-Expression" > $PROFILE
    Get-Content .\powershell\Profile.ps1 >> $PROFILE
    oh-my-posh init pwsh | Invoke-Expression
}

beautifyPwsh