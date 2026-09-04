# Счётные строки без ICU-суффиксов (196)

Одна en-форма с числовым плейсхолдером. Проверить вручную: ru-формулировка
должна быть устойчива к числу (глоссарий: «Сообщений: {count}», не «{count} сообщений»).

| Ключ | en | ru |
| --- | --- | --- |
| `automations.runCount` | Ran {count} times | Выполнений: {count} |
| `automations.runCountLimited` | Ran {count}/{max} times | Выполнений: {count}/{max} |
| `automations.schedule.customMonthlyDates` | Every {interval} months on day {days} at {time} | Каждые {interval} мес, числа {days}, в {time} |
| `automations.schedule.customWeekly` | Every {interval} weeks on {days} at {time} | Каждые {interval} нед, {days}, в {time} |
| `automations.schedule.weekly` | Weekly on {days} at {time} | Еженедельно {days} в {time} |
| `automations.time.ago` | {amount} ago | {amount} назад |
| `automations.time.in` | in {amount} | через {amount} |
| `bots.allowedWorkspaces.selectedDescription` | This bot can use {count} selected workspaces. | Этот бот может использовать выбранные рабочие папки ({count}). |
| `bots.edit.userWorkspaces` | {count} workspace(s) allowed | Разрешено рабочих папок: {count} |
| `bots.setup.bindAdvanceIn` | Continuing in {seconds}s. | Продолжение через {seconds} с. |
| `bots.setup.bound` | {count} user(s) bound. Continue to configure this bot. | Пользователей привязано: {count}. Продолжите настройку бота. |
| `bots.userCount` | {count} users | Пользователей: {count} |
| `chat.askQuestion.questionsCount` | {count} questions | Вопросов: {count} |
| `chat.attachments.maxFiles` | You can attach up to {count} attachments | Максимум вложений: {count} |
| `chat.changeSummary.rewindDialog.ignoredTitle` | Ignored {count} | Пропущено: {count} |
| `chat.changeSummary.rewindDialog.operationCount` | {count} change(s) | Изменений: {count} |
| `chat.changeSummary.rewindDialog.safeTitle` | Safe to undo {count} | Можно безопасно отменить: {count} |
| `chat.changeSummary.rewindDialog.unsafeTitle` | Unsafe to undo {count} | Нельзя безопасно отменить: {count} |
| `chat.codeCommentCards.expandAll` | Show {count} comments | Показать комментарии ({count}) |
| `chat.composer.backgroundWorks.ariaLabel` | Open running background tasks: {bashCount} Bash, {subagentCount} Subagent, {count} total | Открыть запущенные фоновые задачи: Bash — {bashCount}, субагентов — {subagentCount}, всего {count} |
| `chat.contextUsage` | Context usage {used} of {total} | Использование контекста: {used} из {total} |
| `chat.cuaReadiness.toolsNotLoaded` | ZCode Computer Use is still preparing — its tools aren't loaded yet ({count} loaded). Grant the permissions below; tools appear once the helper is ready. | ZCode Computer Use ещё готовится — инструменты пока не загружены (загружено: {count}). Предоставьте разрешения ниже; инструменты появятся, когда служебный процесс будет готов. |
| `chat.elicitation.countdownSeconds` | {seconds}s | {seconds} с |
| `chat.longRunning.elapsedMinutesSeconds` | Running for {minutes}m {seconds}s | Выполняется {minutes} мин {seconds} с |
| `chat.longRunning.elapsedSeconds` | Running for {seconds}s | Выполняется {seconds} с |
| `chat.mention.category.results` | {count} matches | Совпадений: {count} |
| `chat.mention.whiteboards.strokeCount` | {count} strokes | Штрихов: {count} |
| `chat.message.toolSlice.notice` | Showing {shown} / {total} tool calls. | Показано {shown} / {total} вызовов инструментов. |
| `chat.permission.fileChange.addMany` | Creates {count} files | Создание файлов: {count} |
| `chat.permission.fileChange.mixedMany` | Update {count} files | Создание и изменение файлов: {count} |
| `chat.permission.fileChange.updateMany` | Updates {count} files | Изменение файлов: {count} |
| `chat.planUsage.contextDetail` | {used} / {total} | {used} / {total} |
| `chat.planUsage.toolRemaining` | {remaining} / {total} remaining · resets {time} | Осталось {remaining} / {total} · обновление {time} |
| `chat.planUsage.toolUsed` | {used} / {total} used · resets {time} | Использовано {used} / {total} · обновление {time} |
| `chat.queue.sendConfirm.description` | You're about to send a message. Clear the {count} previously queued messages? | Сейчас будет отправлено сообщение. Очистить ранее отложенные сообщения ({count})? |
| `chat.queue.title` | Queued messages ({count}) | Сообщения в очереди ({count}) |
| `chat.quota.startPlan.modelExhausted` | {model} has {percent} of today's free plan quota remaining. Switch models or upgrade. | У модели {model} осталось {percent} сегодняшней квоты бесплатного тарифа. Смените модель или оформите тарифный план. |
| `chat.quota.startPlan.modelHalfUsed` | {model} has {percent} of today's free plan quota remaining. Upgrade for steadier capacity. | У модели {model} осталось {percent} сегодняшней квоты бесплатного тарифа. Оформите тарифный план, чтобы получить более стабильную производительность. |
| `chat.quota.startPlan.modelLow` | {model} has {percent} of today's free plan quota remaining. Switch models or upgrade. | У модели {model} осталось {percent} сегодняшней квоты бесплатного тарифа. Смените модель или оформите тарифный план. |
| `chat.quota.startPlan.modelVeryLow` | {model} has only {percent} of today's free plan quota remaining. Upgrade to keep this task going. | У модели {model} осталось лишь {percent} сегодняшней квоты бесплатного тарифа. Оформите тарифный план, чтобы продолжить текущую задачу. |
| `chat.reasoning.durationSeconds` | {seconds} seconds | {seconds} с |
| `chat.selections.count` | {count} conversation selections | Фрагментов диалога: {count} |
| `chat.statusPanel.runningAgentsValue` | {count} running | Запущено: {count} |
| `chat.statusPanel.runningAgentsValuePlural` | {count} running | Запущено: {count} |
| `chat.statusPanel.runningStatusValue` | {count} in background | В фоне: {count} |
| `chat.statusPanel.runningStatusValuePlural` | {count} in background | В фоне: {count} |
| `chat.statusPanel.todoCompletedExpanded` | Hide {count} completed | Скрыть выполненные: {count} |
| `chat.statusPanel.todoCompletedFold` | {count} completed | Выполнено: {count} |
| `chat.statusPanel.todoEarlierFold` | {count} earlier | Ранее: {count} |
| `chat.statusPanel.todoLaterFold` | {count} later | Позже: {count} |
| `chat.statusPanel.todoWaitingExpanded` | Hide {count} waiting | Скрыть ожидающие: {count} |
| `chat.statusPanel.todoWaitingFold` | {count} waiting | Ожидают: {count} |
| `chat.summaryPanel.goalIterationValue` | Iteration {count} | Итерация {count} |
| `chat.summaryPanel.runningBackgroundTasksMiniValue` | {count} background | {count} в фоне |
| `chat.summaryPanel.runningBackgroundTasksMiniValuePlural` | {count} background | {count} в фоне |
| `chat.summaryPanel.todoGoalIterationGroup` | Iteration {count} | Итерация {count} |
| `chat.toolCall.agent.output.hiddenRows` | {count} earlier rows omitted; open split view for full output | Пропущено более ранних строк: {count}; полный вывод — в разделённом виде |
| `chat.toolCall.agent.output.recentRows` | Latest {visible} rows / {total} total | Строк: {visible} / всего {total} |
| `chat.toolCall.childCount` | {count} child tools | Дочерних инструментов: {count} |
| `chat.toolCall.cua.clickElement` | Click element #{index} | Клик по элементу #{index} |
| `chat.toolCall.cua.clickElementFailed` | Failed to click element #{index} | Не удалось кликнуть по элементу #{index} |
| `chat.toolCall.cua.details.appsFound` | Found {count} running apps | Найдено запущенных приложений: {count} |
| `chat.toolCall.cua.details.elementTarget` | Interface element #{index} | Элемент интерфейса #{index} |
| `chat.toolCall.cua.details.typed` | Typed {count} characters | Введено символов: {count} |
| `chat.toolCall.cua.details.windowsFound` | Found {count} windows | Найдено окон: {count} |
| `chat.toolCall.cua.elementTarget` | Element #{index} | Элемент #{index} |
| `chat.toolCall.cua.listWindowsCount` | {count} windows | Окон: {count} |
| `chat.toolCall.edit.multipleFiles` | {count} files | Файлов: {count} |
| `chat.toolCall.executeGroup.failed` | {count} failed | Ошибок: {count} |
| `chat.toolCall.executeGroup.stopped` | {count} stopped | Остановлено: {count} |
| `chat.turnNavigator.jumpToQuery` | Jump to query {index} | Перейти к запросу {index} |
| `chat.workspaceHookPending.message` | {count} workspace hook(s) pending review; disabled for this session | Хуков рабочей папки, ожидающих проверки: {count}; для этой сессии они отключены. |
| `codeBlock.mermaid.zoomToPercent` | Zoom to {percent}% | Масштаб {percent}% |
| `codingPlan.quotaReset.contextReminder.available` | {count} reset available | Доступно сбросов: {count} |
| `codingPlan.quotaReset.countdown.daysHours` | {days}d {hours}h | {days} д {hours} ч |
| `codingPlan.quotaReset.countdown.daysOnly` | {days}d | {days} д |
| `codingPlan.quotaReset.countdown.hoursMinutes` | {hours}h {minutes}m | {hours} ч {minutes} мин |
| `codingPlan.quotaReset.countdown.hoursOnly` | {hours}h | {hours} ч |
| `codingPlan.quotaReset.countdown.minutesSeconds` | {minutes}m {seconds}s | {minutes} мин {seconds} с |
| `codingPlan.quotaReset.dialog.itemCount` | ×{count} | ×{count} |
| `codingPlan.quotaReset.openDialog` | Get {count} reset quotas | Получить сбросы квоты: {count} |
| `codingPlan.quotaReset.opportunity` | {count} reset available | Доступно сбросов: {count} |
| `developerTools.network.requestHeaders` | Request headers ({count}) | Заголовки запроса ({count}) |
| `developerTools.network.responseHeaders` | Response headers ({count}) | Заголовки ответа ({count}) |
| `diff.preview.truncatedLines` | Diff preview truncated: {count} lines omitted to keep UI responsive. | Чтобы интерфейс оставался отзывчивым, предпросмотр диффа усечён: пропущено строк: {count}. |
| `feedback.duration.days` | {count} day(s) | {count} д |
| `feedback.duration.hours` | {count} hr | {count} ч |
| `feedback.duration.minutes` | {count} min | {count} мин |
| `feedback.submit.screenshotLimit` | You can add up to {count} screenshots | Можно добавить до {count} скриншотов |
| `feedback.supplement.attachmentLimit` | You can add up to {count} attachments | Можно добавить до {count} вложений |
| `feedback.time.daysAgo` | {count} day(s) ago | {count} д назад |
| `feedback.time.hoursAgo` | {count} hr ago | {count} ч назад |
| `feedback.time.minutesAgo` | {count} min ago | {count} мин назад |
| `feedback.timeline.stepCount` | {count} step(s) | Шагов: {count} |
| `git.actionMenu.commitDialog.changesValue` | {count} files | Файлов: {count} |
| `git.branchSwitcher.commitDialog.changesValue` | {count} files | Файлов: {count} |
| `git.branchSwitcher.currentDirty` | Uncommitted changes: {count} files | Файлов с незакоммиченными изменениями: {count} |
| `git.branchSwitcher.error.moreFiles` |  and {count} more files |  и ещё {count} файлов |
| `git.selection.count` | {count} selected | Выбрано: {count} |
| `gitGraph.metric.merges` | {count} merges | Слияний: {count} |
| `gitGraph.metric.refs` | {count} refs | Ссылок: {count} |
| `gitGraph.subtitle` | {count} commits across {lanes} lanes | Коммитов: {count}, дорожек: {lanes} |
| `gitGraph.subtitle.hasMore` | Latest {count} commits across {lanes} lanes | Последние коммиты: {count}, дорожек: {lanes} |
| `logout.confirm.descriptionWithRunningSessions` | {count} session(s) are currently running. Disconnecting will interrupt them and restart the app. | Сейчас выполняется сессий: {count}. Отключение прервёт их и перезапустит приложение. |
| `manualClaimPlan.claim.ticket.benefit` | {model} {amount} {unit} | {model} {amount} {unit} |
| `manualClaimPlan.claim.ticket.benefit.daily` | {model} daily {amount} {unit} | {model} {amount} {unit} в день |
| `modelTrajectory.summaryCalls` | {count} calls | Вызовов: {count} |
| `modelTrajectory.usage.input` | in {count} | Ввод: {count} |
| `modelTrajectory.usage.output` | out {count} | Вывод: {count} |
| `offPeak.create.remaining.hours` | {hours} hr | {hours} ч |
| `offPeak.create.remaining.hoursMinutes` | {hours} hr {minutes} min | {hours} ч {minutes} мин |
| `offPeak.create.remaining.minutes` | {minutes} min | {minutes} мин |
| `offPeak.history.durationMinutes` | {count} min | {count} мин |
| `offPeak.newTask.carousel.goToSlide` | Go to idle-time task template {index} | Перейти к шаблону фоновой задачи {index} |
| `onboarding.footer.selection` | {count} items selected | Выбрано: {count} |
| `onboarding.footer.workspaceSelection` | {count} workspaces selected | Выбрано рабочих папок: {count} |
| `onboarding.sessions.count` | {count} sessions | Сессий: {count} |
| `processMonitor.processCount` | {count} processes | Процессов: {count} |
| `quickPick.find.results` | {current} / {total} results | Результатов: {current} / {total} |
| `repoWiki.failedPages` | Failed pages: {count} | Страниц с ошибками: {count} |
| `repoWiki.failedPagesHint` | {count} page(s) failed to generate. Retry just the missing pages without regenerating everything. | Ошибок генерации страниц: {count}. Можно повторить только недостающие страницы, не пересоздавая вики целиком. |
| `settings.commands.import.itemCount` | {count} commands | Команд: {count} |
| `settings.commands.import.selectionCount` | {selected}/{total} selected | Выбрано {selected}/{total} |
| `settings.commands.import.summary` | Found {count} importable commands | Найдено команд: {count} |
| `settings.mcp.remoteSync.selectionCount` | {selected}/{total} selected | Выбрано {selected}/{total} |
| `settings.mcp.status.toolCount` | {count} tools | Инструментов: {count} |
| `settings.mcpServers.import.itemCount` | {count} MCP servers | MCP-серверов: {count} |
| `settings.mcpServers.import.selectionCount` | {selected}/{total} selected | Выбрано {selected}/{total} |
| `settings.mcpServers.import.summary` | Found {count} importable MCP servers | Найдено MCP-серверов для импорта: {count} |
| `settings.memory.viewer.updated.minutesAgo` | {count} min ago | {count} мин назад |
| `settings.migration.candidatesCount` | {count} candidates | Кандидатов: {count} |
| `settings.migration.selectedCount` | {count} selected | Выбрано: {count} |
| `settings.modelProvider.codingPlan.enterprise.balanceAvailable` | Available {amount} | Доступно {amount} |
| `settings.modelProvider.codingPlan.enterprise.currentCashBalance` | Current account balance {amount} | Текущий баланс: {amount} |
| `settings.modelProvider.codingPlan.enterprise.currentGiftBalance` | Current gift balance {amount} | Текущий подарочный баланс: {amount} |
| `settings.modelProvider.codingPlan.enterprise.seatCountValue` | {count} seats | Мест: {count} |
| `settings.modelProvider.modelsCount` | {count} models | Моделей: {count} |
| `settings.plugins.checkForUpdates.found` | Found {count} plugin update(s) available | Найдено обновлений плагинов: {count} |
| `settings.plugins.detail.items` | {count} items | Элементов: {count} |
| `settings.plugins.footerSummary` | {total} plugins · {enabled} enabled | Плагинов: {total} · включено: {enabled} |
| `settings.plugins.import.itemCount` | {count} plugins | Плагинов: {count} |
| `settings.plugins.import.selectionCount` | {selected}/{total} selected | Выбрано: {selected}/{total} |
| `settings.plugins.import.summary` | Found {count} importable plugins | Найдено плагинов для импорта: {count} |
| `settings.plugins.marketplace.expandGroup` | Show {count} more | Показать ещё {count} |
| `settings.plugins.marketplace.groupCount` | {count} plugins | Плагинов: {count} |
| `settings.plugins.marketplace.hiddenInstalledCount` | +{count} more | Ещё {count} |
| `settings.plugins.marketplace.searchResults` | {count} matching plugins | Найдено подходящих плагинов: {count} |
| `settings.plugins.marketplace.showMore` | Show {count} more | Показать ещё {count} |
| `settings.plugins.marketplaces.count` | {count} marketplaces | Маркетплейсов: {count} |
| `settings.plugins.marketplaces.plugins` | {count} plugins | Плагинов: {count} |
| `settings.plugins.remoteSync.selectionCount` | {selected}/{total} selected | Выбрано: {selected}/{total} |
| `settings.plugins.store.searchResults` | Search results ({count}) | Результаты поиска ({count}) |
| `settings.plugins.store.sources.pluginCount` | {count} plugins | Плагинов: {count} |
| `settings.plugins.store.viewMore` | See {names}, and {count} more | Показать {names} и ещё {count} |
| `settings.remoteSync.preflightTimeout` | Remote write check timed out after {seconds}s. Check the remote connection and try again. | Проверка права записи на удалённой стороне не завершилась за {seconds} с. Проверьте удалённое подключение и повторите попытку. |
| `settings.skills.footerSummary` | {total} skills · {enabled} enabled | Скиллов: {total} · включено: {enabled} |
| `settings.skills.import.itemCount` | {count} skills | Скиллов: {count} |
| `settings.skills.import.selectionCount` | {selected}/{total} selected | Выбрано: {selected}/{total} |
| `settings.skills.import.skillCount` | {count} skills | Скиллов: {count} |
| `settings.skills.import.summary` | Found {count} importable skills | Найдено скиллов для импорта: {count} |
| `settings.skills.remoteSync.selectionCount` | {selected}/{total} selected | Выбрано: {selected}/{total} |
| `settings.subagents.footerSummary` | {total} subagents · {enabled} enabled | Субагентов: {total} · Включено: {enabled} |
| `settings.subagents.toolsCount` | {count} tools | Инструментов: {count} |
| `settings.usage.dailyChartDescription` | Token usage trend by day across {days} days. | Динамика использования токенов по дням за {days} дней. |
| `settings.usage.entitlementTokenUsage` | 5-hour prompt pool used {percent} | 5-часовой пул запросов: использовано {percent} |
| `settings.usage.heatmapCell` | {date}
{tokens} tokens · {turns} messages | {date}
Токенов: {tokens} · Сообщений: {turns} |
| `settings.usage.heatmapCumulativeCell` | Through {date} week cumulative
{tokens} tokens · {turns} messages | Накопительно к неделе {date}
Токенов: {tokens} · Сообщений: {turns} |
| `settings.usage.heatmapCumulativeToolCell` | Through {date} week cumulative
{tokens} tokens · {tools} tools | Накопительно к неделе {date}
Токенов: {tokens} · Инструментов: {tools} |
| `settings.usage.heatmapDescription` | The busiest day was {day}, with about {tokens} tokens. | Самый активный день — {day}: около {tokens} токенов. |
| `settings.usage.heatmapToolCell` | {date}
{tokens} tokens · {tools} tools | {date}
Токенов: {tokens} · Инструментов: {tools} |
| `settings.usage.heatmapWeeklyCell` | {date} week
{tokens} tokens · {turns} messages | Неделя {date}
Токенов: {tokens} · Сообщений: {turns} |
| `settings.usage.heatmapWeeklyToolCell` | {date} week
{tokens} tokens · {tools} tools | Неделя {date}
Токенов: {tokens} · Инструментов: {tools} |
| `settings.usage.peakHourTokens` | {tokens} tokens | Токенов: {tokens} |
| `settingsSync.discovery.agentCount` | Agents found: {count} | Найдено агентов: {count} |
| `settingsSync.discovery.categoryCount` | Categories found: {count} | Найдено категорий: {count} |
| `settingsSync.importing.summary.failed` | Failed {count} | Ошибок: {count} |
| `settingsSync.importing.summary.skipped` | Skipped {count} | Пропущено: {count} |
| `settingsSync.importing.summary.success` | Completed {count} | Завершено: {count} |
| `settingsSync.selection.selectedCategoryCount` | Selected {count} | Выбрано: {count} |
| `settingsSync.unit.categoryCount` | {count} categories | Категорий: {count} |
| `settingsSync.unit.itemCount` | {count} items | Элементов: {count} |
| `sidePane.time.daysAgo` | {count}d ago | {count} д назад |
| `sidePane.time.hoursAgo` | {count}h ago | {count} ч назад |
| `sidePane.time.minutesAgo` | {count}m ago | {count} мин назад |
| `sidebar.usage.plan.percentUsed` | {percent}% used | Использовано {percent}% |
| `taskList.attentionCount` | {label} · {count} | {label} · {count} |
| `taskList.daysAgo` | {days}d | {days} д |
| `taskList.hoursAgo` | {hours}h | {hours} ч |
| `taskList.minutesAgo` | {minutes}m | {minutes} мин |
| `taskSearch.expandMoreSnippets` | Show {count} more snippets | Показать ещё фрагменты: {count} |
| `taskTimeline.daysAgo` | {days} days ago | {days} дн. назад |
| `treemapping.detail.directoryFiles` | {count} files | Файлов: {count} |
| `treemapping.empty.running` | {count} tool call(s) are running without a file path yet. | Вызовов инструментов без пути к файлу: {count}. |
| `webRemoteControl.mobileHome.taskCount` | {count} tasks | Задач: {count} |
| `workspaceSidebar.windowsReservedNameRisk` | Project removed, but {count} Windows reserved-name file(s) were detected and may affect later folder deletion or renaming: {path} | Проект удалён, но обнаружены файлы с зарезервированными именами Windows ({count}); они могут помешать последующему удалению или переименованию папки: {path} |
| `wsl.detectedCount` | {count} distros detected on this device. | На этом устройстве найдено дистрибутивов: {count}. |
