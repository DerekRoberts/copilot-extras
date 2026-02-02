# Kilo Rules

Personal rules and configuration for Kilo Code AI assistant.

## Structure

- [`README.md`](README.md) - This file (for humans, not read by Kilo)
- [`rules/`](rules/) - Directory containing Kilo rule files

### Rule Files

The following files are in the [`rules/`](rules/) directory and should be symlinked to `~/.kilocode/rules`:

- [`rules/workflow.md`](rules/workflow.md) - Git completion requirements and workflow rules
- [`rules/communication.md`](rules/communication.md) - Communication style and active feedback rules
- [`rules/documentation.md`](rules/documentation.md) - Markdown formatting and documentation guidelines
- [`rules/personal-rules.md`](rules/personal-rules.md) - Repository overview and philosophy

## Setup

Symlink the rules directory to your Kilo Code rules directory:

```bash
ln -sf ~/Repos/kilorules/rules ~/.kilocode/rules
```

This makes all rule files available to Kilo Code without including this README.
