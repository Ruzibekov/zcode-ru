#!/bin/bash
# Полностью автоматическая установка: вежливо просит ZCode закрыться -> ждёт ->
# подменяет app.asar -> переподписывает ad-hoc -> перезапускает.
# Не завелось — авто-откат asar. Ручных действий не требуется.
set -u
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
APP="/Applications/ZCode.app"
RES="$APP/Contents/Resources"
RU="$ROOT/build/app-ru.asar"
STOCK="$ROOT/work/backup/app.asar.stock"
LOG="$ROOT/build/apply.log"
exec >> "$LOG" 2>&1
echo "=== apply start $(date) ==="

[ -f "$RU" ]    || { echo "FAIL: нет $RU"; exit 1; }
[ -f "$STOCK" ] || { echo "FAIL: нет бэкапа $STOCK"; exit 1; }

# 1. вежливая остановка: AppleEvent quit (сохраняет состояние), затем мягкое ожидание
osascript -e 'tell application "ZCode" to quit' 2>/dev/null \
  && echo "отправлен quit $(date)" || echo "quit не принят (не запущено?)"

# 2. ждём закрытия до 30 сек; при зависании — SIGTERM, затем SIGKILL
for i in $(seq 1 15); do
  pgrep -f "/Applications/ZCode\.app/Contents" >/dev/null 2>&1 || break
  sleep 2
done
if pgrep -f "/Applications/ZCode\.app/Contents" >/dev/null 2>&1; then
  echo "не закрылось за 30с — SIGTERM"
  pkill -TERM -f "/Applications/ZCode\.app/Contents" 2>/dev/null
  sleep 4
fi
if pgrep -f "/Applications/ZCode\.app/Contents" >/dev/null 2>&1; then
  echo "SIGTERM не помог — SIGKILL (принудительное завершение)"
  pkill -KILL -f "/Applications/ZCode\.app/Contents" 2>/dev/null
  sleep 2
fi
if pgrep -f "/Applications/ZCode\.app/Contents" >/dev/null 2>&1; then
  echo "FAIL: не удалось закрыть ZCode — установка отменена"; exit 1
fi
sleep 2
echo "приложение закрыто $(date)"

cp -f "$RU" "$RES/app.asar.new" && mv -f "$RES/app.asar.new" "$RES/app.asar" \
  || { echo "FAIL: подмена не удалась"; exit 1; }
echo "asar заменён"

xattr -cr "$APP"
codesign --force --deep --sign - "$APP" && echo "переподписан ad-hoc" || echo "WARN: codesign ошибка"

open -a "$APP"
sleep 10
if pgrep -f "/Applications/ZCode\.app/Contents" >/dev/null 2>&1; then
  echo "SUCCESS: запущено $(date)"
else
  echo "FAIL: не запустилось — откатываю stock asar"
  cp -f "$STOCK" "$RES/app.asar"
  xattr -cr "$APP"
  codesign --force --deep --sign - "$APP"
  open -a "$APP"
  echo "RESTORED $(date)"
fi
