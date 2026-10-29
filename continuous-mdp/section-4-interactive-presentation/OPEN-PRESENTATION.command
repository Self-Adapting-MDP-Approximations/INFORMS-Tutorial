#!/bin/zsh

set -e

SCRIPT_DIR="${0:A:h}"
PORT=8765
URL="http://127.0.0.1:${PORT}/section-4-self-adapting-mdps-research-readout.html"

cd "$SCRIPT_DIR"

if command -v python3 >/dev/null 2>&1; then
  PYTHON_BIN="$(command -v python3)"
elif command -v python >/dev/null 2>&1; then
  PYTHON_BIN="$(command -v python)"
else
  echo "Python was not found. Install Python 3, then run this launcher again."
  read -r "?Press Return to close."
  exit 1
fi

echo "Starting the Section 4 presentation at:"
echo "$URL"
echo
echo "Keep this window open while presenting. Press Control-C to stop."

"$PYTHON_BIN" -m http.server "$PORT" --bind 127.0.0.1 >/tmp/section-4-interactive-presentation.log 2>&1 &
SERVER_PID=$!
trap 'kill "$SERVER_PID" 2>/dev/null || true' EXIT INT TERM

for attempt in {1..30}; do
  if curl --silent --fail "$URL" >/dev/null 2>&1; then
    open "$URL"
    wait "$SERVER_PID"
    exit $?
  fi
  sleep 0.2
done

echo "The local presentation server did not start."
echo "See /tmp/section-4-interactive-presentation.log for details."
read -r "?Press Return to close."
exit 1
