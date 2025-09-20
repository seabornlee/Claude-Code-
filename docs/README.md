# Claude Code 智囊团系统

## 🌟 项目简介

Claude Code 智囊团系统是一个包含 10 个专业化 agents 的集体智能平台，通过结构化协作流程和多样化的思维角度，为复杂问题提供系统性的思考解决方案。

### 系统特色

- **10个专业化 agents**: 涵盖商业、技术、管理、数据等多个领域
- **结构化协作**: 智能的 agent 间协作机制
- **灵活调用**: 支持 Claude Code 中的便捷调用
- **协议驱动**: 标准化的思考流程和讨论方法

## 🚀 快速开始

### 安装

1. **确保 Claude Code 已安装**
   ```bash
   # 检查 Claude Code 是否已安装
   claude --version
   ```

2. **一键安装所有 agents**
   ```bash
   # 在项目目录中运行
   ./install.sh
   ```

3. **重启 Claude Code** 以确保所有 agents 正确加载

### 基本使用

在 Claude Code 中，使用 `@agent_name` 语法调用特定的 agent：

```bash
# 调用业务战略家
@business-strategist 请帮我分析这个商业模式

# 调用技术架构师
@technology-architect 评估这个系统架构方案

# 调用多个 agents 协作
@facilitator 组织一个关于产品战略的讨论
```

## 👥 Agents 介绍

### 专家角色 (5个)

#### 📊 业务战略家 (business-strategist)
- **专长**: 商业模式创新、市场分析、战略规划
- **适用场景**: 商业决策、市场定位、竞争分析
- **调用方式**: `@business-strategist`

#### 🎨 设计专家 (design-expert)
- **专长**: 用户体验、设计思维、创新方法
- **适用场景**: 产品设计、用户体验优化、创新解决方案
- **调用方式**: `@design-expert`

#### 🏗️ 技术架构师 (technology-architect)
- **专长**: 系统设计、技术选型、架构评估
- **适用场景**: 技术方案评估、架构设计、技术决策
- **调用方式**: `@technology-architect`

#### 📋 项目管理大师 (project-management-master)
- **专长**: 资源规划、执行管理、风险控制
- **适用场景**: 项目规划、进度管理、风险评估
- **调用方式**: `@project-management-master`

#### 📈 数据科学顾问 (data-science-advisor)
- **专长**: 数据分析、预测建模、洞察提取
- **适用场景**: 数据分析、预测模型、商业智能
- **调用方式**: `@data-science-advisor`

### 协作角色 (5个)

#### 🎯 引导者 (facilitator)
- **专长**: 流程控制、讨论协调、共识构建
- **适用场景**: 团队讨论、决策协调、流程优化
- **调用方式**: `@facilitator`

#### 🧠 教练 (coach)
- **专长**: 思维启发、能力培养、潜力激发
- **适用场景**: 个人发展、团队培训、创新思维
- **调用方式**: `@coach`

#### 🔍 批判者 (critical-thinker)
- **专长**: 假设质疑、风险识别、逻辑验证
- **适用场景**: 方案验证、风险评估、逻辑分析
- **调用方式**: `@critical-thinker`

#### 🔗 整合者 (integrator)
- **专长**: 观点综合、洞察连接、方案构建
- **适用场景**: 方案整合、洞察提炼、决策支持
- **调用方式**: `@integrator`

#### 👁️ 观察者 (observer)
- **专长**: 过程记录、质量监控、反馈分析
- **适用场景**: 过程监控、质量评估、反馈收集
- **调用方式**: `@observer`

## 📚 协议和方法

### 思考池协议 (think-tank-protocol)
- **目的**: 系统化的多 agent 协作框架
- **使用场景**: 复杂问题分析、战略决策、创新思考
- **调用方式**: `@think-tank-protocol`

### 讨论方法论 (discussion-methodologies)
- **目的**: 标准化的讨论流程和技巧
- **使用场景**: 团队讨论、决策过程、问题解决
- **调用方式**: `@discussion-methodologies`

## 💡 使用技巧

### 1. 选择合适的 Agent
- **商业决策** → `@business-strategist`
- **技术问题** → `@technology-architect`
- **团队协作** → `@facilitator`
- **方案验证** → `@critical-thinker`
- **综合分析** → `@integrator`

### 2. 多 Agent 协作
```bash
# 先调用引导者组织讨论
@facilitator 请组织一个关于新产品的讨论

# 引导者会协调其他 agents 参与讨论
```

### 3. 提供清晰的任务描述
```bash
# 清晰的任务描述
@business-strategist 请分析我们的SaaS产品商业模式，重点关注：
1. 收入模式优化
2. 市场差异化
3. 竞争策略
```

### 4. 利用上下文
```bash
# 引用之前的内容
@integrator 请综合前面讨论的观点，提出最终方案
```

## 🛠️ 高级功能

### 自定义 Agent 组合
```bash
# 创建特定的专家组合
@facilitator 请邀请 business-strategist, technology-architect, design-expert 参与讨论
```

### 协议驱动的工作流
```bash
# 使用标准化流程
@think-tank-protocol 启动新产品评估流程
```

### 连续对话
```bash
# 在对话中保持上下文
@coach 基于之前的讨论，请提供具体的改进建议
```

## 🔧 配置管理

### 查看已安装的 Agents
```bash
# 查看配置文件
cat ~/.claude/agents.json
```

### 更新 Agents
```bash
# 重新运行安装脚本
./install.sh
```

### 自定义配置
编辑 `~/.claude/agents.json` 文件来自定义 agent 配置。

## 🐛 故障排除

### 常见问题

1. **Agent 未找到**
   ```bash
   # 重启 Claude Code
   # 确保安装脚本成功运行
   ./install.sh
   ```

2. **权限问题**
   ```bash
   # 检查文件权限
   ls -la ~/.claude/agents/
   chmod 644 ~/.claude/agents/*.md
   ```

3. **配置文件问题**
   ```bash
   # 重新生成配置文件
   rm ~/.claude/agents.json
   ./install.sh
   ```

### 日志查看
```bash
# 查看 Claude Code 日志
tail -f ~/.claude/logs/claude.log
```

## 🤝 贡献指南

### 添加新的 Agent
1. 创建 agent 定义文件 (`.md` 格式)
2. 更新 `install.sh` 脚本
3. 更新 `agents.json` 配置
4. 更新 README 文档

### 改进现有 Agent
1. 编辑对应的 `.md` 文件
2. 测试功能完整性
3. 提交改进建议

## 📄 许可证

本项目采用 MIT 许可证。详见 [LICENSE](LICENSE) 文件。

## 📞 支持

- **问题反馈**: 请提交 Issue
- **功能建议**: 欢迎提出改进建议
- **使用帮助**: 查看 [使用指南](usage-guide.md)

## 🎯 下一步计划

- [ ] 添加更多专业化 agents
- [ ] 实现 agent 间的智能调度
- [ ] 开发 Web 界面
- [ ] 支持多语言 agents
- [ ] 集成外部工具和 API

---

**让智慧团队能力，为您创造更大价值！** 🚀