# Copilot Extras

Personal GitHub Copilot instructions combining shared BCGov standards with personal preferences.

`copilot-instructions` contains the essential standards (git workflow, security, documentation). This repo adds optional personal preferences (communication style, language choices).

## What it does

`generate-copilot-instructions.sh` concatenates:
- Shared BCGov team standards from `../copilot-instructions/.github/copilot-instructions.md`
- Personal preferences from all `*.md` files in `rules/`

Output: `~/.copilot.md` (or custom path via optional argument)

## Usage

```bash
# Generate to default location (~/.copilot.md)
./generate-copilot-instructions.sh

# Generate to custom location
./generate-copilot-instructions.sh /path/to/output.md
```

Displays metrics after generation.

## Integration

### GitHub Copilot (per-project)

Copilot doesn't support global instructions. Include in project-level `.github/copilot-instructions.md`:

```markdown
@~/.copilot.md
```

### Kilo Code & Cursor (global)

These tools support global instructions via symlink:

```bash
# Kilo Code
mkdir -p ~/.kilocode && ln -sf ~/.copilot.md ~/.kilocode/copilot-extras.md

# Cursor
mkdir -p ~/.cursor && ln -sf ~/.copilot.md ~/.cursor/copilot-extras.md
```

## Structure

- `generate-copilot-instructions.sh` - Generator script
- `metrics-tracker.sh` - Analyzes generated output complexity
- `rules/` - Personal rules (all `*.md` files concatenated alphabetically)
