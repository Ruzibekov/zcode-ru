#!/bin/bash
# Полный откат к оригинальному ZCode из бэкапа проекта.
# Закрой ZCode, затем: bash tools/restore.sh
set -eu
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
APP="/Applications/ZCode.app"
BAK="$ROOT/work/backup/ZCode-stock.app"

if pgrep -f "/Applications/ZCode\.app/Contents" >/dev/null 2>&1; then
  echo "Сначала закрой ZCode (Cmd+Q)."; exit 1
fi
[ -d "$BAK" ] || { echo "Бэкап не найден: $BAK"; exit 1; }

rm -rf "$APP" 2>/dev/null || true
ditto "$BAK" "$APP"
open -a "$APP"
echo "Оригинальный ZCode восстановлен и запущен."
