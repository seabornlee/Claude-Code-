@echo off
echo 🚀 Claude Code Agents 安装程序
echo ================================

:: 检查是否在正确的目录
if not exist "business-strategist.md" (
    echo ❌ 错误: 请在包含智囊团文件的目录中运行此脚本
    pause
    exit /b 1
)

:: 检查 Claude Code 是否已安装
where claude >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ 错误: Claude Code 未安装
    echo 请先安装 Claude Code: https://docs.claude.com/en/docs/claude-code/installation
    pause
    exit /b 1
)

:: 获取用户主目录
set USERPROFILE=%USERPROFILE%
set CLAUDE_CONFIG_DIR=%USERPROFILE%\.claude

:: 创建 Claude Code 配置目录
if not exist "%CLAUDE_CONFIG_DIR%" (
    echo 创建 Claude Code 配置目录...
    mkdir "%CLAUDE_CONFIG_DIR%"
)

:: 创建 agents 子目录
set AGENTS_DIR=%CLAUDE_CONFIG_DIR%\agents
if not exist "%AGENTS_DIR%" (
    echo 创建 agents 目录...
    mkdir "%AGENTS_DIR%"
)

:: 创建 commands 子目录
set COMMANDS_DIR=%CLAUDE_CONFIG_DIR%\commands
if not exist "%COMMANDS_DIR%" (
    echo 创建 commands 目录...
    mkdir "%COMMANDS_DIR%"
)

echo 📁 安装目录: %AGENTS_DIR%
echo 📁 命令目录: %COMMANDS_DIR%

:: 定义要复制的 agents
set AGENTS=business-strategist.md design-expert.md technology-architect.md project-management-master.md data-science-advisor.md facilitator.md coach.md critical-thinker.md integrator.md observer.md philosopher.md think-tank-protocol.md discussion-methodologies.md

:: 复制 agent 文件
echo 📦 复制 agents...
for %%a in (%AGENTS%) do (
    if exist "%%a" (
        copy "%%a" "%AGENTS_DIR%\" >nul
        echo ✅ 安装: %%a
    ) else (
        echo ⚠️  警告: %%a 不存在
    )
)

:: 复制 facilitator 作为斜杠命令
if exist "facilitator.md" (
    copy "facilitator.md" "%COMMANDS_DIR%\facilitator.md" >nul
    echo ✅ 安装斜杠命令: /facilitator
) else (
    echo ⚠️  警告: facilitator.md 不存在
)

:: 创建 agents 配置文件
echo 🔧 创建配置文件: agents.json

echo { > "%CLAUDE_CONFIG_DIR%\agents.json"
echo   "agents": { >> "%CLAUDE_CONFIG_DIR%\agents.json"
echo     "business-strategist": { >> "%CLAUDE_CONFIG_DIR%\agents.json"
echo       "name": "业务战略家", >> "%CLAUDE_CONFIG_DIR%\agents.json"
echo       "description": "商业模式创新、市场分析、战略规划专家", >> "%CLAUDE_CONFIG_DIR%\agents.json"
echo       "file": "agents/business-strategist.md" >> "%CLAUDE_CONFIG_DIR%\agents.json"
echo     }, >> "%CLAUDE_CONFIG_DIR%\agents.json"
echo     "design-expert": { >> "%CLAUDE_CONFIG_DIR%\agents.json"
echo       "name": "设计专家", >> "%CLAUDE_CONFIG_DIR%\agents.json"
echo       "description": "用户体验、设计思维、创新方法专家", >> "%CLAUDE_CONFIG_DIR%\agents.json"
echo       "file": "agents/design-expert.md" >> "%CLAUDE_CONFIG_DIR%\agents.json"
echo     }, >> "%CLAUDE_CONFIG_DIR%\agents.json"
echo     "technology-architect": { >> "%CLAUDE_CONFIG_DIR%\agents.json"
echo       "name": "技术架构师", >> "%CLAUDE_CONFIG_DIR%\agents.json"
echo       "description": "系统设计、技术选型、架构评估专家", >> "%CLAUDE_CONFIG_DIR%\agents.json"
echo       "file": "agents/technology-architect.md" >> "%CLAUDE_CONFIG_DIR%\agents.json"
echo     }, >> "%CLAUDE_CONFIG_DIR%\agents.json"
echo     "project-management-master": { >> "%CLAUDE_CONFIG_DIR%\agents.json"
echo       "name": "项目管理大师", >> "%CLAUDE_CONFIG_DIR%\agents.json"
echo       "description": "资源规划、执行管理、风险控制专家", >> "%CLAUDE_CONFIG_DIR%\agents.json"
echo       "file": "agents/project-management-master.md" >> "%CLAUDE_CONFIG_DIR%\agents.json"
echo     }, >> "%CLAUDE_CONFIG_DIR%\agents.json"
echo     "data-science-advisor": { >> "%CLAUDE_CONFIG_DIR%\agents.json"
echo       "name": "数据科学顾问", >> "%CLAUDE_CONFIG_DIR%\agents.json"
echo       "description": "数据分析、预测建模、洞察提取专家", >> "%CLAUDE_CONFIG_DIR%\agents.json"
echo       "file": "agents/data-science-advisor.md" >> "%CLAUDE_CONFIG_DIR%\agents.json"
echo     }, >> "%CLAUDE_CONFIG_DIR%\agents.json"
echo     "facilitator": { >> "%CLAUDE_CONFIG_DIR%\agents.json"
echo       "name": "引导者", >> "%CLAUDE_CONFIG_DIR%\agents.json"
echo       "description": "流程控制、讨论协调、共识构建专家", >> "%CLAUDE_CONFIG_DIR%\agents.json"
echo       "file": "agents/facilitator.md" >> "%CLAUDE_CONFIG_DIR%\agents.json"
echo     }, >> "%CLAUDE_CONFIG_DIR%\agents.json"
echo     "coach": { >> "%CLAUDE_CONFIG_DIR%\agents.json"
echo       "name": "教练", >> "%CLAUDE_CONFIG_DIR%\agents.json"
echo       "description": "思维启发、能力培养、潜力激发专家", >> "%CLAUDE_CONFIG_DIR%\agents.json"
echo       "file": "agents/coach.md" >> "%CLAUDE_CONFIG_DIR%\agents.json"
echo     }, >> "%CLAUDE_CONFIG_DIR%\agents.json"
echo     "critical-thinker": { >> "%CLAUDE_CONFIG_DIR%\agents.json"
echo       "name": "批判者", >> "%CLAUDE_CONFIG_DIR%\agents.json"
echo       "description": "假设质疑、风险识别、逻辑验证专家", >> "%CLAUDE_CONFIG_DIR%\agents.json"
echo       "file": "agents/critical-thinker.md" >> "%CLAUDE_CONFIG_DIR%\agents.json"
echo     }, >> "%CLAUDE_CONFIG_DIR%\agents.json"
echo     "integrator": { >> "%CLAUDE_CONFIG_DIR%\agents.json"
echo       "name": "整合者", >> "%CLAUDE_CONFIG_DIR%\agents.json"
echo       "description": "观点综合、洞察连接、方案构建专家", >> "%CLAUDE_CONFIG_DIR%\agents.json"
echo       "file": "agents/integrator.md" >> "%CLAUDE_CONFIG_DIR%\agents.json"
echo     }, >> "%CLAUDE_CONFIG_DIR%\agents.json"
echo     "observer": { >> "%CLAUDE_CONFIG_DIR%\agents.json"
echo       "name": "观察者", >> "%CLAUDE_CONFIG_DIR%\agents.json"
echo       "description": "过程记录、质量监控、反馈分析专家", >> "%CLAUDE_CONFIG_DIR%\agents.json"
echo       "file": "agents/observer.md" >> "%CLAUDE_CONFIG_DIR%\agents.json"
echo     }, >> "%CLAUDE_CONFIG_DIR%\agents.json"
echo     "philosopher": { >> "%CLAUDE_CONFIG_DIR%\agents.json"
echo       "name": "哲学专家", >> "%CLAUDE_CONFIG_DIR%\agents.json"
echo       "description": "全子理论、垂直三位一体理论、整合哲学专家", >> "%CLAUDE_CONFIG_DIR%\agents.json"
echo       "file": "agents/philosopher.md" >> "%CLAUDE_CONFIG_DIR%\agents.json"
echo     } >> "%CLAUDE_CONFIG_DIR%\agents.json"
echo   }, >> "%CLAUDE_CONFIG_DIR%\agents.json"
echo   "protocols": { >> "%CLAUDE_CONFIG_DIR%\agents.json"
echo     "think-tank-protocol": "agents/think-tank-protocol.md", >> "%CLAUDE_CONFIG_DIR%\agents.json"
echo     "discussion-methodologies": "agents/discussion-methodologies.md" >> "%CLAUDE_CONFIG_DIR%\agents.json"
echo   } >> "%CLAUDE_CONFIG_DIR%\agents.json"
echo } >> "%CLAUDE_CONFIG_DIR%\agents.json"

echo.
echo 🎉 安装完成！
echo.
echo 📋 已安装的 agents:
echo    - 业务战略家 (business-strategist)
echo    - 设计专家 (design-expert)
echo    - 技术架构师 (technology-architect)
echo    - 项目管理大师 (project-management-master)
echo    - 数据科学顾问 (data-science-advisor)
echo    - 引导者 (facilitator)
echo    - 教练 (coach)
echo    - 批判者 (critical-thinker)
echo    - 整合者 (integrator)
echo    - 观察者 (observer)
echo    - 哲学专家 (philosopher)
echo.
echo 📚 已安装的协议:
echo    - 思考池协议 (think-tank-protocol)
echo    - 讨论方法论 (discussion-methodologies)
echo.
echo 📖 使用说明:
echo    1. 在 Claude Code 中使用 @agent_name 调用特定 agent
echo    2. 例如: @business-strategist 请帮我分析这个商业模式
echo.
echo 🚀 协作模式:
echo    - @facilitator 请组织一个关于产品策略的讨论
echo    - @think-tank-protocol 启动创新分析流程
echo.
echo ⚡ 斜杠命令:
echo    - /facilitator 直接调用引导者
echo.
echo 📝 详细的指导请查看 README.md 和 QUICK_REFERENCE.md 文件
echo.
echo 💡 提示: 重启 Claude Code 以确保所有 agents 正确加载
echo.
pause