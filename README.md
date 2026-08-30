# ZCode RU — русская локализация ZCode.app

**RU** | [EN](#english)

Русская локализация (ru-RU) десктоп-приложения [ZCode](https://zcode.z.ai) от Z.ai.
Полноценный третий язык интерфейса: System / English / **Русский** — 5 018 строк UI.

> ⚠️ Неофициальный-community-проект. Модифицирует установленное приложение (см. [SAFETY.md](SAFETY.md)).
> Привязан к версии ZCode **3.10.1** (build 6272).

## Статус

| Компонент | Состояние |
|---|---|
| Рендерер (окна, чат, настройки) | 5 018 ключей — 100% корпуса |
| Диалоги/трей main process | системные — английские (ru → en-US ветка) |
| CLI (`zcode` в терминале) | не локализован |
| Мелкие окна (мониторинг процессов, CUA-разрешения) | переведены |

## Установка (macOS, ZCode 3.10.1)

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/warment/zcode-ru/v2.0.0/tools/install.sh)
```

Скрипт: проверяет версию приложения → бэкапит → подменяет `app.asar` на русифицированный →
переподписывает ad-hoc → перезапускает ZCode. Установка требует полного закрытия приложения
и ~1 минуты. Откат — той же командой с `--restore` (см. ниже).

Ручной путь: скачать `app-ru.asar` из [Releases](https://github.com/warment/zcode-ru/releases) и заменить `app.asar` вручную (не забудьте про переподпись) — либо использовать `tools/apply.sh` из репозитория.

> Версия для ZCode **3.0.1** (старый подход, словарь 3.5k) — тег `v1.0-zcode-3.0.1` и релиз v1.

## Как это работает

Словари интерфейса ZCode зашиты в `app.asar` (IntlProvider-чанк, локали zh-CN/en-US).
Пак добавляет третий словарь `ru-RU` (fallback на английский для новых строк апстрима),
регистрирует локаль в whitelist'ах рендерера и main process, добавляет пункт «Русский»
в селектор языка (Настройки → Язык) и учит системное определение локали (`ru*` → `ru-RU`).

Изменяются 6 файлов внутри asar; проверка целостности Electron (fuse) в этом билде
отключена, поэтому Info.plist не затрагивается; подпись после патча — ad-hoc.

## Обновления

При обновлении ZCode патч слетает (asar заменяется установщиком). Порядок:

```bash
node scripts/extract.mjs   # новый корпус из установленной версии
node scripts/check.mjs --strict   # что изменилось
node scripts/build.mjs     # пересборка
bash tools/apply.sh        # установка (закрой ZCode — скрипт дождётся)
```

## Для разработчиков

```bash
npm install
npm run extract      # корпус en+zh из app.asar → upstream/corpus.json
npm run check:strict # валидация словаря (полнота, плейсхолдеры, мусор)
npm run build        # build/app-ru.asar
```

Словарь: `dict/ru/*.json` — плоские `{"ключ": "русский"}`, пачки по namespace'ам.
Правила перевода и глоссарий: [docs/glossary.md](docs/glossary.md).

## English

Unofficial Russian (ru-RU) localization pack for the ZCode desktop app by Z.ai.
Adds a third UI language (System / English / Русский) by patching `app.asar`
of the installed app. Targets ZCode 3.10.1 — see [SAFETY.md](SAFETY.md) before use.
Build from source: `npm install && npm run build`, then `bash tools/apply.sh`
(closes the app automatically). Restore: `bash tools/restore.sh`.

## Лицензия

MIT — см. [LICENSE](LICENSE). Авторство ZCode — Z.ai: [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md).
