#!/bin/bash
#
# Generate ~/.copilot.md from all rule files
# Usage: ./generate-copilot-instructions.sh
#

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUTPUT_FILE="${HOME}/.copilot.md"

# External copilot-instructions (local copy)
EXTERNAL_FILE="${SCRIPT_DIR}/../copilot-instructions/.github/copilot-instructions.md"
LOCAL_RULES_DIR="${SCRIPT_DIR}/rules"

{
    echo "# Copilot Instructions"
    echo ""
    echo "_Auto-generated from generate-copilot-instructions.sh_"
    echo "_Do not edit manually - edit files in rules/ instead_"
    echo ""
    echo "---"
    echo ""

    # External shared rules
    if [[ -f "$EXTERNAL_FILE" ]]; then
        echo "## External Shared Rules"
        echo ""
        cat "$EXTERNAL_FILE"
        echo ""
        echo "---"
        echo ""
    else
        echo "Warning: External file not found at $EXTERNAL_FILE"
        echo "---"
        echo ""
    fi

    # Local rules from rules/ directory
    echo "## Local Rules"
    echo ""
    for rule in communication documentation workflow; do
        if [[ -f "${LOCAL_RULES_DIR}/${rule}.md" ]]; then
            echo "### $(echo "$rule" | sed 's/^\(.\)/\U\1/') Rules"
            echo ""
            cat "${LOCAL_RULES_DIR}/${rule}.md"
            echo ""
        else
            echo "Warning: Local rule not found at ${LOCAL_RULES_DIR}/${rule}.md"
        fi
    done

    echo "---"
    echo ""
    echo "_Generated at $(date -Iseconds)_"

} > "$OUTPUT_FILE"

echo "Generated: $OUTPUT_FILE"
