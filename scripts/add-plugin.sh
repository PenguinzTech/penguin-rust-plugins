#!/usr/bin/env bash
# Scaffold a new plugin directory + its per-plugin GitHub Actions workflow,
# stage on a fresh branch, and optionally open a PR.
#
# Hard rules:
#   - Refuses to run directly on main — forces a branch so the PR flow happens.
#   - Refuses if the slug doesn't resolve on umod.org (avoids typos and
#     opening a PR against a hijacked or non-existent slug).
#   - Does not push or create a PR without explicit confirmation — the human
#     operator stays in the loop.
#
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
REGISTRY="${REPO_ROOT}/registry.txt"
BRANCH="add-plugin/${SLUG}"

cd "${REPO_ROOT}"

# ─── Pre-flight: slug format ─────────────────────────────────────────────────
if ! [[ "${SLUG}" =~ ^[a-z0-9][a-z0-9-]*[a-z0-9]$ ]]; then
    echo "FATAL: slug '${SLUG}' must be lowercase alphanumeric with hyphens, no leading/trailing hyphen." >&2
    exit 1
fi
if ! [[ "${FILENAME}" =~ ^[A-Za-z0-9_]+\.cs$ ]]; then
    echo "FATAL: filename '${FILENAME}' must match ^[A-Za-z0-9_]+\\.cs$" >&2
    exit 1
fi

# ─── Pre-flight: branch is not main ──────────────────────────────────────────
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
if [ "${CURRENT_BRANCH}" = "main" ]; then
    echo "Not allowed to scaffold directly on main — switching to ${BRANCH}..."
    # Fail fast on a dirty tree; we don't want to drag unrelated changes into the PR.
    if ! git diff --quiet || ! git diff --cached --quiet; then
        echo "FATAL: working tree has uncommitted changes — stash or commit first." >&2
        exit 1
    fi
    if git show-ref --verify --quiet "refs/heads/${BRANCH}"; then
        echo "FATAL: branch '${BRANCH}' already exists locally — delete it or pick a different slug." >&2
        exit 1
    fi
    git checkout -b "${BRANCH}"
fi

# ─── Pre-flight: slug resolves on umod.org ───────────────────────────────────
echo "Verifying slug resolves at https://umod.org/plugins/${SLUG}.cs ..."
STATUS=$(curl -s -o /dev/null -w '%{http_code}' -I "https://umod.org/plugins/${SLUG}.cs")
if [ "${STATUS}" != "200" ]; then
    echo "FATAL: https://umod.org/plugins/${SLUG}.cs returned HTTP ${STATUS}." >&2
    echo "       Typo in the slug? Or the plugin was removed upstream?" >&2
    exit 1
fi
echo "  OK (HTTP 200)"

# ─── Pre-flight: not already registered ──────────────────────────────────────
if [ -e "${WORKFLOW}" ]; then
    echo "FATAL: workflow already exists: ${WORKFLOW}" >&2
    exit 1
fi
if grep -qE "^${SLUG}\|" "${REGISTRY}" 2>/dev/null; then
    echo "FATAL: ${SLUG} already in registry.txt" >&2
    exit 1
fi

# ─── Scaffold ────────────────────────────────────────────────────────────────
mkdir -p "${PLUGIN_DIR}/reports"
touch "${PLUGIN_DIR}/.gitkeep"

sed -e "s|{{SLUG}}|${SLUG}|g" \
    -e "s|{{FILENAME}}|${FILENAME}|g" \
    "${TEMPLATE}" > "${WORKFLOW}"

echo "${SLUG}|${FILENAME}" >> "${REGISTRY}"

git add "${WORKFLOW}" "${PLUGIN_DIR}" "${REGISTRY}"
git commit -m "plugin(${SLUG}): scaffold workflow + registry entry"

echo ""
echo "Scaffolded on branch ${BRANCH}:"
echo "  ${WORKFLOW}"
echo "  ${PLUGIN_DIR}/"
echo "  registry.txt (entry: ${SLUG}|${FILENAME})"
echo ""
echo "Next steps (NOT automatic — a human must approve):"
echo "  1. Review the diff: git show"
echo "  2. Push the branch:  git push -u origin ${BRANCH}"
echo "  3. Open the PR:      gh pr create --fill --label plugin-proposal"
echo ""
echo "scan-pr.yml will run the full scanner suite against upstream .cs on PR open."
