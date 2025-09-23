#!/bin/bash

# Claude Code Agents 卸载脚本
# 一键卸载智囊团系统所有 agents 和相关文件

set -e

echo "🗑️  Claude Code Agents 卸载程序"
echo "================================"

# 获取 Claude Code 配置目录
CLAUDE_CONFIG_DIR="$HOME/.claude"
if [ ! -d "$CLAUDE_CONFIG_DIR" ]; then
    echo "ℹ️  Claude Code 配置目录不存在，无需卸载"
    exit 0
fi

AGENTS_DIR="$CLAUDE_CONFIG_DIR/agents"
COMMANDS_DIR="$CLAUDE_CONFIG_DIR/commands"

# 显示将删除的文件
echo "📋 将要删除的文件:"

if [ -d "$AGENTS_DIR" ]; then
    echo "📁 Agents 目录: $AGENTS_DIR/"
    for file in "$AGENTS_DIR"/*.md; do
        if [ -f "$file" ]; then
            echo "   - $(basename "$file")"
        fi
    done
fi

if [ -d "$COMMANDS_DIR" ]; then
    echo "📁 Commands 目录: $COMMANDS_DIR/"
    for file in "$COMMANDS_DIR"/*.md; do
        if [ -f "$file" ]; then
            echo "   - $(basename "$file")"
        fi
    done
fi

if [ -f "$CLAUDE_CONFIG_DIR/agents.json" ]; then
    echo "📄 配置文件: agents.json"
fi

# 确认是否继续
echo ""
read -p "⚠️  确定要删除以上所有文件吗？(y/N): " -n 1 -r
echo ""
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "❌ 卸载已取消"
    exit 1
fi

# 删除 agents 目录
if [ -d "$AGENTS_DIR" ]; then
    echo "🗑️  删除 agents 目录..."
    rm -rf "$AGENTS_DIR"
    echo "✅ agents 目录已删除"
fi

# 删除 commands 目录
if [ -d "$COMMANDS_DIR" ]; then
    echo "🗑️  删除 commands 目录..."
    rm -rf "$COMMANDS_DIR"
    echo "✅ commands 目录已删除"
fi

# 删除配置文件
if [ -f "$CLAUDE_CONFIG_DIR/agents.json" ]; then
    echo "🗑️  删除配置文件..."
    rm -f "$CLAUDE_CONFIG_DIR/agents.json"
    echo "✅ agents.json 已删除"
fi

# 清理空的父目录
if [ -d "$CLAUDE_CONFIG_DIR" ] && [ -z "$(ls -A "$CLAUDE_CONFIG_DIR")" ]; then
    echo "🗑️  清理空的配置目录..."
    rmdir "$CLAUDE_CONFIG_DIR"
    echo "✅ Claude Code 配置目录已删除"
fi

echo ""
echo "🎉 卸载完成！"
echo ""
echo "💡 提示: 重启 Claude Code 以确保所有 agents 正确卸载"
echo ""
echo "📁 如果需要重新安装，请运行:"
echo "   bash install.sh"