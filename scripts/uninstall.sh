#!/bin/bash

# Claude Code Agents 卸载脚本
# 只卸载智囊团系统安装的 agents 和相关文件，保留其他项目文件

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
CONFIG_FILE="$CLAUDE_CONFIG_DIR/agents.json"

# 定义本项目安装的 agents 和 commands
declare -a PROJECT_AGENTS=(
    "business-strategist.md"
    "design-expert.md"
    "technology-architect.md"
    "project-management-master.md"
    "data-science-advisor.md"
    "execution-expert.md"
    "facilitator.md"
    "coach.md"
    "critical-thinker.md"
    "integrator.md"
    "observer.md"
    "philosopher.md"
    "think-tank-protocol.md"
    "discussion-methodologies.md"
)

declare -a PROJECT_COMMANDS=(
    "facilitator.md"
)

# 检查哪些文件存在并显示将删除的文件
echo "📋 将要删除的文件:"

files_to_delete=()

# 检查 agents
for agent in "${PROJECT_AGENTS[@]}"; do
    if [ -f "$AGENTS_DIR/$agent" ]; then
        echo "   - agents/$agent"
        files_to_delete+=("$AGENTS_DIR/$agent")
    fi
done

# 检查 commands
for cmd in "${PROJECT_COMMANDS[@]}"; do
    if [ -f "$COMMANDS_DIR/$cmd" ]; then
        echo "   - commands/$cmd"
        files_to_delete+=("$COMMANDS_DIR/$cmd")
    fi
done

# 检查是否需要更新配置文件
if [ -f "$CONFIG_FILE" ]; then
    echo "   - 更新 agents.json 配置文件"
    update_config=true
else
    update_config=false
fi

if [ ${#files_to_delete[@]} -eq 0 ] && [ "$update_config" = false ]; then
    echo "ℹ️  没有找到需要卸载的文件"
    exit 0
fi

# 确认是否继续
echo ""
read -p "⚠️  确定要删除以上所有文件吗？(y/N): " -n 1 -r
echo ""
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "❌ 卸载已取消"
    exit 1
fi

# 删除项目特定的 agent 文件
echo "🗑️  删除项目 agents..."
for file in "${files_to_delete[@]}"; do
    if [ -f "$file" ]; then
        rm -f "$file"
        echo "✅ 已删除: $(basename "$file")"
    fi
done

# 更新配置文件，移除项目相关的 agents
if [ "$update_config" = true ] && [ -f "$CONFIG_FILE" ]; then
    echo "🔄 更新配置文件..."

    # 创建临时文件
    temp_config=$(mktemp)

    # 移除项目特定的 agents 从配置文件中
    python3 -c "
import json
import sys

# 项目相关的 agent 名称
project_agents = {
    'business-strategist', 'design-expert', 'technology-architect',
    'project-management-master', 'data-science-advisor', 'execution-expert',
    'facilitator', 'coach', 'critical-thinker', 'integrator',
    'observer', 'philosopher'
}

# 项目相关的协议
project_protocols = {
    'think-tank-protocol', 'discussion-methodologies'
}

# 读取现有配置
try:
    with open('$CONFIG_FILE', 'r', encoding='utf-8') as f:
        config = json.load(f)

    # 移除项目 agents
    if 'agents' in config:
        agents_to_remove = []
        for agent_name in config['agents']:
            if agent_name in project_agents:
                agents_to_remove.append(agent_name)

        for agent_name in agents_to_remove:
            del config['agents'][agent_name]

    # 移除项目协议
    if 'protocols' in config:
        protocols_to_remove = []
        for protocol_name in config['protocols']:
            if protocol_name in project_protocols:
                protocols_to_remove.append(protocol_name)

        for protocol_name in protocols_to_remove:
            del config['protocols'][protocol_name]

    # 如果配置为空，删除整个配置文件
    if not config.get('agents') and not config.get('protocols'):
        import os
        os.remove('$CONFIG_FILE')
        print('✅ agents.json 已删除（配置为空）')
    else:
        # 写回配置文件
        with open('$CONFIG_FILE', 'w', encoding='utf-8') as f:
            json.dump(config, f, indent=2, ensure_ascii=False)
        print('✅ agents.json 已更新')

except Exception as e:
    print(f'⚠️  配置文件更新失败: {e}')
    sys.exit(1)
"

    # 清理临时文件
    rm -f "$temp_config"
fi

# 清理空的目录
if [ -d "$AGENTS_DIR" ] && [ -z "$(ls -A "$AGENTS_DIR" 2>/dev/null)" ]; then
    echo "🗑️  agents 目录为空，正在删除..."
    rmdir "$AGENTS_DIR"
    echo "✅ agents 目录已删除"
fi

if [ -d "$COMMANDS_DIR" ] && [ -z "$(ls -A "$COMMANDS_DIR" 2>/dev/null)" ]; then
    echo "🗑️  commands 目录为空，正在删除..."
    rmdir "$COMMANDS_DIR"
    echo "✅ commands 目录已删除"
fi

echo ""
echo "🎉 卸载完成！"
echo ""
echo "💡 提示: 重启 Claude Code 以确保所有 agents 正确卸载"
echo ""
echo "🔒 安全说明: 只删除了本项目安装的 agents，其他项目的文件未被影响"
echo ""
echo "📁 如果需要重新安装，请运行:"
echo "   bash scripts/install.sh"