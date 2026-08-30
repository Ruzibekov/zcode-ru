#!/bin/bash
# Одноразовый аккуратный выход из ZCode (запускается в отрыве от сессии).
sleep 12
osascript -e 'tell application "ZCode" to quit' 2>/dev/null
sleep 5
pgrep -f "/Applications/ZCode\.app/Contents" >/dev/null 2>&1 && \
  pkill -TERM -f "/Applications/ZCode\.app/Contents"
sleep 3
pgrep -f "/Applications/ZCode\.app/Contents" >/dev/null 2>&1 && \
  pkill -KILL -f "/Applications/ZCode\.app/Contents"
exit 0
