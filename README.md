# Copilot Extras

Personal GitHub Copilot instructions combining shared BCGov standards with personal preferences.

`copilot-instructions` contains the essential standards (git workflow, security, documentation). This repo adds optional personal preferences (communication style, language choices).

## What it does

`generate-copilot-instructions.sh` concatenates:
- Shared BCGov team standards from `../copilot-instructions/.github/copilot-instructions.md`
- Personal preferences from all `*.md` files in `rules/`

Output: `~/.copilot.md` (read by GitHub Copilot)

## Usage

```bash
./generate-copilot-instructions.sh
```

Displays metrics after generation. Run after editing files in `rules/`.

### Using with other AI tools

Other tools like Kilo Code and Cursor can use the generated instructions via symlink:

```bash
# Kilo Code
ln -sf ~/.copilot.md ~/.kilocode/instructions.md

# Cursor
ln -sf ~/.copilot.md ~/.cursor/instructions.md
```

## Structure

- `generate-copilot-instructions.sh` - Generator script
- `metrics-tracker.sh` - Analyzes generated output complexity
- `rules/` - Personal rules (all `*.md` files concatenated alphabetically)
