# Kilo Rules

Personal rules and configuration for Kilo Code AI assistant.

## Purpose

These rules configure Kilo's AI assistant behavior to match personal preferences and workflow requirements. They complement shared team standards (like BCGov's copilot-instructions) with personal preferences.

**Why both sets?**
- `./rules/` = Personal preferences (communication style, workflow requirements, etc.)
- `https://github.com/bcgov/copilot-instructions/blob/main/.github/copilot-instructions.md` = Shared team/work standards
- Together they provide complete context: shared standards + personal preferences

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

Symlink all rule files to Kilo's global rules directory:

```bash
mkdir -p ~/.kilocode/rules
ln -sf PATH_TO_KILORULES_REPO/rules/*.md ~/.kilocode/rules/
```

Replace `PATH_TO_KILORULES_REPO` with the actual path to your kilorules clone.

## Updates

Pull the latest changes from this repository:

```bash
git pull
```

Kilo will automatically reload rules on next conversation.

## Customization

Edit files in `rules/` to match your preferences. Key sections:

- **Code Completion Requirements** - Workflow enforcement (rules/workflow.md)
- **Communication Style** - How AI should interact (rules/communication.md)
- **Documentation Guidelines** - Markdown formatting (rules/documentation.md)
- **Rule Placement Philosophy** - How to organize rules (rules/personal-rules.md)
