# Claude Code 智囊团 - 快速参考

## 🚀 一键安装
```bash
# macOS/Linux
./install.sh

# Windows
install.bat
```

## 👥 Agents 快速调用

### 专家角色
| Agent | 调用方式 | 专长领域 |
|-------|----------|----------|
| 业务战略家 | `@business-strategist` | 商业模式、市场分析 |
| 设计专家 | `@design-expert` | 用户体验、设计思维 |
| 技术架构师 | `@technology-architect` | 系统设计、技术选型 |
| 项目管理大师 | `@project-management-master` | 资源规划、风险管理 |
| 数据科学顾问 | `@data-science-advisor` | 数据分析、预测建模 |

### 协作角色
| Agent | 调用方式 | 专长领域 |
|-------|----------|----------|
| 引导者 | `@facilitator` | 流程控制、讨论协调 |
| 教练 | `@coach` | 思维启发、能力培养 |
| 批判者 | `@critical-thinker` | 假设质疑、风险识别 |
| 整合者 | `@integrator` | 观点综合、方案构建 |
| 观察者 | `@observer` | 过程记录、质量监控 |

## 🎯 使用场景

### 商业决策
```bash
@business-strategist 分析这个商业模式
@business-strategist 评估市场竞争策略
```

### 技术方案
```bash
@technology-architect 评估这个架构设计
@technology-architect 选择合适的技术栈
```

### 团队协作
```bash
@facilitator 组织产品讨论会
@coach 提供团队建设建议
```

### 方案验证
```bash
@critical-thinker 验证这个方案的可行性
@integrator 综合各方意见形成最终方案
```

## 📚 协议调用
```bash
@think-tank-protocol 启动复杂问题分析流程
@discussion-methodologies 使用标准讨论方法
```

## 🤝 协作模式（核心功能）

### 方式1：引导者全权协调
```bash
@facilitator 请组织一个关于新产品战略的讨论
```
**预期行为**:
- facilitator 分析问题性质
- 自动邀请相关专家（业务战略家、设计专家、技术架构师等）
- 协调各方讨论
- 形成综合建议

### 方式2：指定专家组合
```bash
@facilitator 邀请 @business-strategist, @technology-architect, @design-expert 参与产品规划
```
**预期行为**:
- facilitator 协调指定的专家
- 每个专家从自己的专业角度提供意见
- 整合不同视角的建议

### 方式3：协议驱动流程
```bash
@think-tank-protocol 启动产品创新分析流程
```
**预期行为**:
- 按照标准化的五阶段流程执行
- 自动在适当阶段邀请相关专家
- 结构化的问题解决过程

### 方式4：逐步深化讨论
```bash
@business-strategist 分析市场机会
@facilitator 基于前面的分析，请技术专家评估可行性
@integrator 综合前面的讨论，形成最终方案
```
**预期行为**:
- 保持上下文连续性
- 逐步深入问题分析
- 基于前面的讨论继续深化

## 💡 使用技巧

1. **明确任务**: 提供清晰的任务描述和背景信息
2. **上下文**: 在对话中引用之前的内容保持连续性
3. **组合使用**: 多个 agent 协作获得更全面的分析
4. **逐步深入**: 从高层分析到详细实现逐步深入

## 🐛 故障排除
```bash
# 重启 Claude Code
# 重新运行安装脚本
./install.sh
```

---
详细使用说明请查看 [README.md](README.md)