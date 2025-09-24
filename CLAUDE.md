# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a **Wisdom Team System** - a comprehensive multi-agent collaboration framework for Claude Code that implements a "think tank" system with 12 specialized AI agents. The project consists of two main components:

1. **Agent System**: A sophisticated multi-agent collaboration framework
2. **4DX Health Plan**: A practical application demonstrating the agent system's capabilities

## Key Development Commands

### Installation and Setup
```bash
# Install all agents to Claude Code
./scripts/install.sh

# Install on Windows
./scripts/install.bat

# Test agent functionality
./scripts/test_agents.sh

# Uninstall agents (preserves other projects)
./scripts/uninstall.sh
```

### Agent Testing
```bash
# Test specific agent functionality
./scripts/test_agents.sh --agent business-strategist

# Test all agents
./scripts/test_agents.sh --all

# Validate agent configuration
./scripts/test_agents.sh --validate
```

### Documentation and PDF Generation
```bash
# Convert documentation to PDF
python test/convert_to_pdf.py

# Generate quick reference guide
python test/convert_to_pdf.py --input docs/QUICK_REFERENCE.md
```

## Architecture Overview

### Multi-Agent System Structure
The system contains **12 specialized agents** organized into two categories:

**Domain Experts (6 agents):**
- `business-strategist` - Business strategy, market analysis,商业模式创新
- `design-expert` - UX design, design thinking,用户体验
- `technology-architect` - System architecture, technical selection
- `project-management-master` - Resource planning, risk management
- `data-science-advisor` - Data analysis, predictive modeling
- `execution-expert` - 4DX framework specialist

**Collaboration Specialists (6 agents):**
- `facilitator` - Master coordinator for multi-agent discussions
- `coach` - Leadership development and potential cultivation
- `critical-thinker` - Logical analysis and assumption challenging
- `integrator` - Pattern recognition and insight synthesis
- `observer` - Process documentation and quality monitoring
- `philosopher` - Deep structural thinking using holonic theory

### Installation Architecture
The installation system safely deploys agents to Claude Code's configuration:
- **Agent files**: `~/.claude/agents/` - Individual agent definitions
- **Commands**: `~/.claude/commands/` - Slash command shortcuts
- **Configuration**: `~/.claude/agents.json` - Agent registry and metadata
- **Permissions**: Automatic permission management and validation

### Protocol System
Two core collaboration protocols enable structured multi-agent workflows:
- `think-tank-protocol` - Systematic multi-agent analysis framework
- `discussion-methodologies` - Various discussion facilitation techniques

## Agent Configuration Format

Each agent follows a standardized YAML header format:
```yaml
---
name: agent-name
description: Expert description
model: sonnet
---
```

The configuration file (`~/.claude/agents.json`) maps agent names to their metadata and file locations.

## Usage Patterns

### Single Agent Consultation
```bash
@business-strategist Analyze this business model
@technology-architect Evaluate this system architecture
@design-expert Improve this user experience
```

### Multi-Agent Collaboration
```bash
@facilitator Organize a discussion about product strategy
@think-tank-protocol Start innovation analysis process
```

### Agent Combinations
Common combinations for specific problem types:
- **Business Strategy**: `business-strategist` + `execution-expert` + `data-science-advisor`
- **Product Development**: `design-expert` + `technology-architect` + `project-management-master`
- **Innovation**: `critical-thinker` + `philosopher` + `integrator`

## File Organization

### Key Directories
- `/agents/` - All agent definition files (.md format)
- `/protocols/` - Collaboration framework definitions
- `/scripts/` - Installation and management utilities
- `/solution/` - Demonstration project (4DX Health Plan)
- `/docs/` - Documentation and quick reference
- `/test/` - Testing utilities and validation tools

### Naming Conventions
- **Agent files**: kebab-case (e.g., `business-strategist.md`)
- **Protocol files**: descriptive names (e.g., `think-tank-protocol.md`)
- **Scripts**: standard shell script conventions
- **Documentation**: standard markdown files

## Development Workflow

### Adding New Agents
1. Create agent definition file in `/agents/` with YAML header
2. Update `scripts/install.sh` to include new agent
3. Update configuration generation in install script
4. Test with `./scripts/test_agents.sh`
5. Update documentation in `/docs/`

### Modifying Existing Agents
1. Edit agent definition file
2. Test functionality with test script
3. Update installation if needed
4. Update documentation

### Safe Installation Practices
The installation system includes several safety features:
- Validates Claude Code installation before proceeding
- Checks for existing configuration and creates backups
- Sets proper file permissions (644 for configuration files)
- Provides uninstallation that preserves other projects
- Cross-platform support (macOS/Linux, Windows)

## Key Features

### Multi-Agent Intelligence
- 12 specialized agents covering multiple domains
- Collaborative problem-solving through structured protocols
- Context-aware agent selection based on problem type

### 4DX Framework Integration
- Specialized execution expert for the 4 Disciplines of Execution
- Focus on wildly important goals, lead measures, compelling scoreboards
- Practical application in health and personal development

### Philosophical Depth
- Unique integration of philosophical expertise
- Deep structural analysis capabilities
- Cross-disciplinary synthesis and pattern recognition

### User-Friendly Design
- One-click installation scripts
- Comprehensive documentation and quick reference
- Safe uninstallation preserving other projects
- Cross-platform compatibility

## Quality Assurance

### Testing Framework
The system includes comprehensive testing:
- Agent functionality validation
- Installation process verification
- Configuration file integrity checks
- Cross-platform compatibility testing

### Documentation Standards
- Comprehensive README with usage examples
- Quick reference guide for common tasks
- Agent-specific documentation with expertise areas
- Installation troubleshooting guide

### Security and Safety
- Safe installation with validation checks
- Permission management and file validation
- Clean uninstallation without side effects
- Configuration backup and restoration capabilities