@echo off
rem Claude Code Agents 卸载脚本
rem Windows版本 - 一键卸载智囊团系统所有 agents 和相关文件

echo 🗑️  Claude Code Agents 卸载程序
echo ================================

rem 获取用户配置目录
set USERPROFILE=%USERPROFILE%
set CLAUDE_CONFIG_DIR=%USERPROFILE%\.claude

if not exist "%CLAUDE_CONFIG_DIR%" (
    echo ℹ️  Claude Code 配置目录不存在，无需卸载
    pause
    exit /b 0
)

set AGENTS_DIR=%CLAUDE_CONFIG_DIR%\agents
set COMMANDS_DIR=%CLAUDE_CONFIG_DIR%\commands

rem 显示将删除的文件
echo 📋 将要删除的文件:

if exist "%AGENTS_DIR%" (
    echo 📁 Agents 目录: %AGENTS_DIR%\
    dir /b "%AGENTS_DIR%\*.md" 2>nul | findstr . >nul
    if %errorlevel% equ 0 (
        dir /b "%AGENTS_DIR%\*.md" | findstr /v /c:"^$"
    )
)

if exist "%COMMANDS_DIR%" (
    echo 📁 Commands 目录: %COMMANDS_DIR%\
    dir /b "%COMMANDS_DIR%\*.md" 2>nul | findstr . >nul
    if %errorlevel% equ 0 (
        dir /b "%COMMANDS_DIR%\*.md" | findstr /v /c:"^$"
    )
)

if exist "%CLAUDE_CONFIG_DIR%\agents.json" (
    echo 📄 配置文件: agents.json
)

rem 确认是否继续
echo.
set /p "choice=⚠️  确定要删除以上所有文件吗？(y/N): "
if /i "%choice%" neq "y" (
    echo ❌ 卸载已取消
    pause
    exit /b 1
)

rem 删除 agents 目录
if exist "%AGENTS_DIR%" (
    echo 🗑️  删除 agents 目录...
    rmdir /s /q "%AGENTS_DIR%"
    echo ✅ agents 目录已删除
)

rem 删除 commands 目录
if exist "%COMMANDS_DIR%" (
    echo 🗑️  删除 commands 目录...
    rmdir /s /q "%COMMANDS_DIR%"
    echo ✅ commands 目录已删除
)

rem 删除配置文件
if exist "%CLAUDE_CONFIG_DIR%\agents.json" (
    echo 🗑️  删除配置文件...
    del /f /q "%CLAUDE_CONFIG_DIR%\agents.json"
    echo ✅ agents.json 已删除
)

rem 清理空的父目录
if exist "%CLAUDE_CONFIG_DIR%" (
    dir /b "%CLAUDE_CONFIG_DIR%" | findstr . >nul
    if %errorlevel% neq 0 (
        echo 🗑️  清理空的配置目录...
        rmdir /q "%CLAUDE_CONFIG_DIR%"
        echo ✅ Claude Code 配置目录已删除
    )
)

echo.
echo 🎉 卸载完成！
echo.
echo 💡 提示: 重启 Claude Code 以确保所有 agents 正确卸载
echo.
echo 📁 如果需要重新安装，请运行:
echo    install.bat
echo.
pause