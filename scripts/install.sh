#!/bin/bash

# Claude Code Agents 安装脚本
# 一键安装智囊团系统所有 agents 到 Claude Code

set -e

echo "🚀 Claude Code Agents 安装程序"
echo "================================"

# 检查是否在正确的目录
if [ ! -f "business-strategist.md" ]; then
    echo "❌ 错误: 请在包含智囊团文件的目录中运行此脚本"
    exit 1
fi

# 检查 Claude Code 是否已安装
if ! command -v claude &> /dev/null; then
    echo "❌ 错误: Claude Code 未安装"
    echo "请先安装 Claude Code: https://docs.claude.com/en/docs/claude-code/installation"
    exit 1
fi

# 获取 Claude Code 配置目录
CLAUDE_CONFIG_DIR="$HOME/.claude"
if [ ! -d "$CLAUDE_CONFIG_DIR" ]; then
    echo "创建 Claude Code 配置目录..."
    mkdir -p "$CLAUDE_CONFIG_DIR"
fi

# 创建 agents 子目录
AGENTS_DIR="$CLAUDE_CONFIG_DIR/agents"
if [ ! -d "$AGENTS_DIR" ]; then
    echo "创建 agents 目录..."
    mkdir -p "$AGENTS_DIR"
fi

# 创建 commands 子目录
COMMANDS_DIR="$CLAUDE_CONFIG_DIR/commands"
if [ ! -d "$COMMANDS_DIR" ]; then
    echo "创建 commands 目录..."
    mkdir -p "$COMMANDS_DIR"
fi

echo "📁 安装目录: $AGENTS_DIR"
echo "📁 命令目录: $COMMANDS_DIR"

# 定义要复制的 agents
declare -a AGENTS=(
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

# 复制 agent 文件
echo "📦 复制 agents..."
for agent in "${AGENTS[@]}"; do
    if [ -f "$agent" ]; then
        cp "$agent" "$AGENTS_DIR/"
        echo "✅ 安装: $agent"
    else
        echo "⚠️  警告: $agent 不存在"
    fi
done

# 复制 facilitator 作为斜杠命令
if [ -f "facilitator.md" ]; then
    cp "facilitator.md" "$COMMANDS_DIR/facilitator.md"
    echo "✅ 安装斜杠命令: /facilitator"
else
    echo "⚠️  警告: facilitator.md 不存在"
fi

# 创建 agents 配置文件
cat > "$CLAUDE_CONFIG_DIR/agents.json" << 'EOF'
{
  "agents": {
    "business-strategist": {
      "name": "业务战略家",
      "description": "商业模式创新、市场分析、战略规划专家",
      "file": "agents/business-strategist.md"
    },
    "design-expert": {
      "name": "设计专家",
      "description": "用户体验、设计思维、创新方法专家",
      "file": "agents/design-expert.md"
    },
    "technology-architect": {
      "name": "技术架构师",
      "description": "系统设计、技术选型、架构评估专家",
      "file": "agents/technology-architect.md"
    },
    "project-management-master": {
      "name": "项目管理大师",
      "description": "资源规划、执行管理、风险控制专家",
      "file": "agents/project-management-master.md"
    },
    "data-science-advisor": {
      "name": "数据科学顾问",
      "description": "数据分析、预测建模、洞察提取专家",
      "file": "agents/data-science-advisor.md"
    },
    "facilitator": {
      "name": "引导者",
      "description": "流程控制、讨论协调、共识构建专家",
      "file": "agents/facilitator.md"
    },
    "coach": {
      "name": "教练",
      "description": "思维启发、能力培养、潜力激发专家",
      "file": "agents/coach.md"
    },
    "critical-thinker": {
      "name": "批判者",
      "description": "假设质疑、风险识别、逻辑验证专家",
      "file": "agents/critical-thinker.md"
    },
    "integrator": {
      "name": "整合者",
      "description": "观点综合、洞察连接、方案构建专家",
      "file": "agents/integrator.md"
    },
    "observer": {
      "name": "观察者",
      "description": "过程记录、质量监控、反馈分析专家",
      "file": "agents/observer.md"
    },
    "philosopher": {
      "name": "哲学专家",
      "description": "全子理论、垂直三位一体理论、整合哲学专家",
      "file": "agents/philosopher.md"
    },
    "execution-expert": {
      "name": "执行力专家",
      "description": "高效执行四原则(4DX)框架专家，专注于将战略转化为成果",
      "file": "agents/execution-expert.md"
    }
  },
  "protocols": {
    "think-tank-protocol": "agents/think-tank-protocol.md",
    "discussion-methodologies": "agents/discussion-methodologies.md"
  }
}
EOF

echo "🔧 创建配置文件: agents.json"

# 设置正确的权限
chmod 644 "$CLAUDE_CONFIG_DIR/agents.json"
for agent in "${AGENTS[@]}"; do
    if [ -f "$AGENTS_DIR/$agent" ]; then
        chmod 644 "$AGENTS_DIR/$agent"
    fi
done

echo ""
echo "🎉 安装完成！"
echo ""
echo "📋 已安装的 agents:"
echo "   - 业务战略家 (business-strategist)"
echo "   - 设计专家 (design-expert)"
echo "   - 技术架构师 (technology-architect)"
echo "   - 项目管理大师 (project-management-master)"
echo "   - 数据科学顾问 (data-science-advisor)"
echo "   - 执行力专家 (execution-expert)"
echo "   - 引导者 (facilitator)"
echo "   - 教练 (coach)"
echo "   - 批判者 (critical-thinker)"
echo "   - 整合者 (integrator)"
echo "   - 观察者 (observer)"
echo "   - 哲学专家 (philosopher)"
echo ""
echo "📚 已安装的协议:"
echo "   - 思考池协议 (think-tank-protocol)"
echo "   - 讨论方法论 (discussion-methodologies)"
echo ""
echo "📖 使用说明:"
echo "   1. 在 Claude Code 中使用 @agent_name 调用特定 agent"
echo "   2. 例如: @business-strategist 请帮我分析这个商业模式"
echo ""
echo "🚀 协作模式:"
echo "   - @facilitator 请组织一个关于产品策略的讨论"
echo "   - @think-tank-protocol 启动创新分析流程"
echo ""
echo "⚡ 斜杠命令:"
echo "   - /facilitator 直接调用引导者"
echo ""
echo "📝 详细的指导请查看 README.md 和 QUICK_REFERENCE.md 文件"
echo ""
echo "💡 提示: 重启 Claude Code 以确保所有 agents 正确加载"