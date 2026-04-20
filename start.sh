#!/bin/bash
# Usage: ./start.sh {rinomaru|amaiki|aichan}
set -e
ACCOUNT=${1:-}
if [[ -z "$ACCOUNT" ]]; then
  echo "Usage: $0 {rinomaru|amaiki|aichan}"
  exit 1
fi
ENV_FILE=".env.$ACCOUNT"
if [[ ! -f "$(dirname "$0")/$ENV_FILE" ]]; then
  echo "Env file not found: $ENV_FILE"
  exit 1
fi
cd "$(dirname "$0")"
source .venv/bin/activate
XMCP_ENV_FILE="$ENV_FILE" python server.py
