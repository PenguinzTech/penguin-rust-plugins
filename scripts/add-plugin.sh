#!/usr/bin/env bash
# Scaffold a new plugin directory + its per-plugin GitHub Actions workflow.
# Usage: ./scripts/add-plugin.sh <slug> <FileName.cs>
set -euo pipefail

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <slug> <FileName.cs>" >&2
    exit 1
fi

SLUG="$1"
FILENAME="$2"
REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
TEMPLATE="${REPO_ROOT}/scanners/template/plugin-workflow.yml.tmpl"
WORKFLOW="${REPO_ROOT}/.github/workflows/plugin-${SLUG}.yml"
PLUGIN_DIR="${REPO_ROOT}/plugins/${SLUG}"

if [ -e "${WORKFLOW}" ]; then
    echo "Workflow already exists: ${WORKFLOW}" >&2
    exit 1
fi

mkdir -p "${PLUGIN_DIR}/reports"
touch "${PLUGIN_DIR}/.gitkeep"

sed -e "s|{{SLUG}}|${SLUG}|g" \
    -e "s|{{FILENAME}}|${FILENAME}|g" \
    "${TEMPLATE}" > "${WORKFLOW}"

echo "Created:"
echo "  ${WORKFLOW}"
echo "  ${PLUGIN_DIR}/"
echo ""
echo "Next: add '${SLUG}|${FILENAME}' to registry.txt, then commit."
