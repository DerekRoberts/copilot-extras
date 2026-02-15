#!/bin/bash
#
# Generate ~/.copilot.md from developer-profile.md
# Usage: ./generate-copilot-instructions.sh
#
# Environment Variables:
#   COPILOT_INSTRUCTIONS_DIR: Path to external copilot-instructions repository
#                            (default: ../copilot-instructions relative to script)
#

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUTPUT_FILE="${HOME}/.copilot.md"

# External copilot-instructions (local copy) - configurable via environment variable
COPILOT_INSTRUCTIONS_DIR="${COPILOT_INSTRUCTIONS_DIR:-${SCRIPT_DIR}/../copilot-instructions}"
EXTERNAL_FILE="${COPILOT_INSTRUCTIONS_DIR}/.github/copilot-instructions.md"
LOCAL_RULES_DIR="${SCRIPT_DIR}/rules"

action="Created"
if [[ -f "$OUTPUT_FILE" ]]; then
    action="Updated"
fi

{
    echo "# Copilot Instructions"
    echo ""
    echo "_Auto-generated from generate-copilot-instructions.sh_"
    echo "_Do not edit manually - edit rules/developer-profile.md instead_"
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
        echo "Warning: External file not found at $EXTERNAL_FILE" >&2
    fi

    # Local rules
    echo "## Local Rules"
    echo ""
    developer_profile="${LOCAL_RULES_DIR}/developer-profile.md"
    if [[ -f "$developer_profile" ]]; then
        echo "### Developer-profile Rules"
        echo ""
        # Skip the first markdown title line (format: "# Title")
        awk 'NR > 1' "$developer_profile"
        echo ""
    else
        echo "Warning: developer-profile.md not found at $developer_profile" >&2
    fi

    echo "---"
    echo ""
    echo "_Generated at $(date -u +'%Y-%m-%dT%H:%M:%SZ')_"

} > "$OUTPUT_FILE"

echo "$action: $OUTPUT_FILE"

# Run metrics analysis on combined output (Kilo + Copilot rules)
echo ""
bash "${SCRIPT_DIR}/scripts/metrics-tracker.sh" "$OUTPUT_FILE"
