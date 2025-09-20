#!/bin/bash

# Claude Code Agents 测试脚本
# 测试智囊团系统的协作功能

set -e

echo "🧪 Claude Code Agents 测试程序"
echo "================================"

# 检查是否安装了 agents
if [ ! -f "$HOME/.claude/agents.json" ]; then
    echo "❌ 错误: 未找到 agents 配置文件"
    echo "请先运行安装脚本: ./install.sh"
    exit 1
fi

# 检查 Claude Code 是否可用
if ! command -v claude &> /dev/null; then
    echo "❌ 错误: Claude Code 未安装或不可用"
    exit 1
fi

echo "✅ 环境检查通过"
echo ""

# 显示已安装的 agents
echo "📋 已安装的 agents:"
python3 -c "
import json
import sys

try:
    with open('$HOME/.claude/agents.json', 'r', encoding='utf-8') as f:
        config = json.load(f)

    agents = config.get('agents', {})
    for agent_id, agent_info in agents.items():
        print(f'   - {agent_info[\"name\"]} ({agent_id})')

    protocols = config.get('protocols', {})
    if protocols:
        print('\\n📚 已安装的协议:')
        for protocol_id, protocol_file in protocols.items():
            print(f'   - {protocol_id}')

except Exception as e:
    print(f'❌ 读取配置文件失败: {e}')
    sys.exit(1)
"

echo ""
echo "🧪 测试建议:"
echo ""
echo "1. 基础功能测试:"
echo "   @business-strategist 请简单介绍一下商业模式分析"
echo ""
echo "2. 协作功能测试:"
echo "   @facilitator 请组织一个关于新产品开发策略的讨论"
echo ""
echo "3. 协议测试:"
echo "   @think-tank-protocol 启动一个简单的分析流程"
echo ""
echo "4. 专家组合测试:"
echo "   @facilitator 邀请 @technology-architect, @design-expert 参与讨论"
echo ""
echo "💡 预期行为:"
echo "   - facilitator 应该自动邀请相关专家参与讨论"
echo "   - 每个专家都应该从自己的专业角度提供意见"
echo "   - 讨论应该结构化并最终形成综合建议"
echo ""
echo "📝 如果协作功能不工作，请检查:"
echo "   1. Claude Code 是否已重启"
echo "   2. agents 配置文件是否正确"
echo "   3. 网络连接是否正常"
echo ""
echo "🚀 现在可以在 Claude Code 中测试 agents 功能了！"