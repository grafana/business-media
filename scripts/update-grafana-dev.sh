#!/usr/bin/env bash
# Fetches the latest grafana-enterprise-dev tag from Docker Hub and writes it to .env

set -euo pipefail

REPO="grafana/grafana-enterprise-dev"
API_URL="https://hub.docker.com/v2/repositories/${REPO}/tags/?page_size=10&ordering=last_updated"

# Fetch the latest non-ubuntu, non-boringcrypto tag (plain commit hash)
TAG=$(curl -sf "$API_URL" \
  | python3 -c "
import sys, json
data = json.load(sys.stdin)
for t in data['results']:
    name = t['name']
    if '-' not in name and len(name) == 8:
        print(name)
        break
")

if [ -z "$TAG" ]; then
  echo "Error: Could not fetch latest tag from ${REPO}" >&2
  exit 1
fi

ENV_FILE="$(cd "$(dirname "$0")/.." && pwd)/.env"

# Update or create GRAFANA_DEV_VERSION in .env
if [ -f "$ENV_FILE" ] && grep -q '^GRAFANA_DEV_VERSION=' "$ENV_FILE"; then
  if [[ "$OSTYPE" == darwin* ]]; then
    sed -i '' "s/^GRAFANA_DEV_VERSION=.*/GRAFANA_DEV_VERSION=${TAG}/" "$ENV_FILE"
  else
    sed -i "s/^GRAFANA_DEV_VERSION=.*/GRAFANA_DEV_VERSION=${TAG}/" "$ENV_FILE"
  fi
else
  echo "GRAFANA_DEV_VERSION=${TAG}" >> "$ENV_FILE"
fi

echo "Updated GRAFANA_DEV_VERSION to ${TAG} in .env"
