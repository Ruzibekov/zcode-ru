#!/bin/bash
# Установка спайк/прод-сборки: ждёт закрытия ZCode -> подменяет app.asar ->
# переподписывает ad-hoc -> перезапускает. Не завелось — авто-откат asar.
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

while pgrep -f "/Applications/ZCode\.app/Contents" >/dev/null 2>&1; do sleep 2; done
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
