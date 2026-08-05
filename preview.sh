#!/usr/bin/env bash
# Preview the static site locally and open it in your default browser.
#
#   ./preview.sh          # picks 8010 (or next free port), opens the browser
#   ./preview.sh 8080     # request a specific port
set -euo pipefail

# Always run from the site directory, wherever the script is called from.
cd "$(dirname "$0")"

PORT="${1:-8010}"

port_in_use() { lsof -nP -iTCP:"$1" -sTCP:LISTEN >/dev/null 2>&1; }

# If the chosen port is busy, walk upward to the next free one.
while port_in_use "$PORT"; do
  echo "Port $PORT is in use, trying $((PORT + 1))…"
  PORT=$((PORT + 1))
done

URL="http://localhost:$PORT"
echo "Serving $(pwd) at $URL   (Ctrl-C to stop)"

# Open the browser once the server is actually accepting connections. This runs
# in the background so it doesn't block the server, which takes over this shell.
(
  for _ in $(seq 1 50); do
    port_in_use "$PORT" && break
    sleep 0.1
  done
  if command -v open >/dev/null 2>&1; then
    open "$URL"            # macOS
  elif command -v xdg-open >/dev/null 2>&1; then
    xdg-open "$URL"        # Linux, just in case
  else
    echo "Couldn't auto-open a browser — visit $URL manually."
  fi
) &

exec python3 -m http.server "$PORT"
