# getmywindows

常用软件，一键安装！免费安装当下热门软件！~~鲁大师、360 安全卫士、2345 全家桶，一网打尽！~~

本项目假定 `winget` 可用。非常建议使用 Windows Terminal。另请手动安装 Powershell 最新版。

## 使用前准备

### 配置 winget

在 `https://github.com/microsoft/winget-cli/releases` 下载 `*.appxbundle` 文件，双击安装。

### 配置 Powershell

```
winget install --id Microsoft.Powershell --source winget
```

### 配置 Git

```
winget install --id Git.Git
```

## 启动脚本

使用 `winkey+x` 并启动终端（管理员），在项目目录下输入：

```
git clone https:/github.com/HeavySnowJakarta/getmywindows.git
cd getmywindows
pwsh # 在命令提示符或 Windows Powershell 下要先进入新版 Powershell 环境
.\start.ps1
```