#!/usr/bin/env bash
set -euo pipefail

# Start Grafana and Postgres in the background, wait until both are healthy.
docker compose up --build --wait grafana postgres 2>&1 | tee playwright-output.log

# Run Playwright. docker compose run starts pdf-loader as a dependency
# (waits for it to complete), then starts Playwright. This avoids the race
# condition where pdf-loader exiting triggers --abort-on-container-exit and
# kills Grafana before the tests run.
docker compose run --build --rm playwright 2>&1 | tee -a playwright-output.log
