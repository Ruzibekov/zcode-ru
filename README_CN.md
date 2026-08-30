<p align="center">
  <img src="https://zcode.z.ai/_next/image?url=%2Fimages%2Fhero-visual%2Fzcode-logo%402x.png&w=128&q=75" alt="ZCode" width="64">
</p>

<h1 align="center">ZCode 俄语本地化包</h1>

<p align="center">
  <strong>为 ZCode 3.10.1 添加完整的俄语界面（ru-RU）</strong><br>
  语言选择器中的第三个语言 — System / English / <strong>Русский</strong>。
</p>

<p align="center">
  <a href="https://github.com/warment/zcode-ru/blob/main/LICENSE">
    <img src="https://img.shields.io/badge/license-MIT-7c3aed.svg" alt="MIT License">
  </a>
  <a href="https://zcode.z.ai">
    <img src="https://img.shields.io/badge/ZCode-3.10.1-7c3aed.svg" alt="ZCode 3.10.1">
  </a>
  <a href="#翻译进度">
    <img src="https://img.shields.io/badge/翻译-100%25-22c55e.svg" alt="100% translated">
  </a>
  <a href="https://github.com/warment/zcode-ru/releases">
    <img src="https://img.shields.io/badge/release-v2.0.0-7c3aed.svg" alt="v2.0.0">
  </a>
</p>

<p align="center">
  <a href="./README.md">Русский</a> · <a href="./README.md#english">English</a> · 中文
</p>

---

## 概述

ZCode 是 Z.ai 推出的 Agentic Development Environment。官方界面只提供中文和英文两种语言，语言字典被编译进 JS 包中，无法通过设置添加新语言。

本语言包只需一条命令即可解决：向应用中添加**原生的第三语言 `ru-RU`**——不替换中文，新增字符串自动回退到英文。

**实现方式：**

```
  ZCode.app（安装前）              ZCode.app（安装后）
┌───────────────────┐        ┌───────────────────┐
│  zh-CN  中文       │        │  zh-CN  中文       │
│  en-US  English   │   →    │  en-US  English   │
│                   │        │  ru-RU  Русский ← │
└───────────────────┘        └───────────────────┘
```

---

## 快速开始

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/warment/zcode-ru/v2.0.0/tools/install.sh)
```

> **注意：** 安装前请完全退出 ZCode——安装脚本不会改动正在运行的应用。

安装脚本执行五个步骤：

| 步骤 | 操作 |
| --- | --- |
| 1 | 检查 ZCode 版本（3.10.1）与应用是否存在 |
| 2 | 备份 `app.asar` → `~/.zcode-ru-backup/` |
| 3 | 从 Release 下载俄语版构建并替换 `app.asar` |
| 4 | 重新签名（ad-hoc） |
| 5 | 重启 ZCode；若启动失败，自动回滚原始文件 |

安装完成后打开 ZCode——设置中将有**三种语言**，包括 **Русский**（俄语）。系统语言为俄语时会自动选择。

随时可以回滚：

```bash
bash install.sh --restore
```

---

## 工作原理

### ru-RU 字典

`IntlProvider-*.js` 中保存着语言注册表——`zh-CN` 和 `en-US` 字典（各约 5000 个键）。本包添加第三个字典：**完整复制英文 + 俄语覆盖层**，因此未翻译的键以及未来版本新增的字符串会显示英文，而不是原始键名。

> 代码块体积：654 KB → 1.1 MB。构建时会验证 JS 解析不被破坏。

### 代码补丁

字典之后，会更新所有校验合法语言的代码位置：

| 文件 | 修改内容 |
| --- | --- |
| `IntlProvider-*.js` | 语言注册表 `g`——添加 `ru-RU`（通过 `Object.assign` 回退到英文） |
| `IntlProvider-*.js` | 语言白名单、系统语言检测（`ru*` → `ru-RU`） |
| `styles-*.js` | 语言选择器——第三个选项「Русский」（3 处） |
| `process-monitor-*.js` | 进程监控窗口的俄语子字典 |
| `cua-permission-panel-*.js` | Computer Use 权限面板的俄语子字典 |
| `chunk-*.js`（main） | 设置的 Zod 校验——enum 中加入 `ru-RU` |
| `index.js`（main） | `resolveSystemApplicationLocale`——系统语言检测 |
| `host/index.js` | 内置代理与输出风格的描述（5 条） |

**合计：** 6 个文件中的 12 处补丁。不改动 Info.plist（该构建未启用 asar 完整性 fuse）。

---

## 翻译进度

<a name="翻译进度"></a>

| 指标 | 数值 |
| --- | --- |
| 语料库键数 | 5 018（82 个命名空间） |
| 已翻译 | 5 018 / 5 018 **（100%）** |
| 回退策略 | 英文——用于上游未来新增的字符串 |

已翻译：聊天、设置、插件、技能、MCP、子代理、git、自动化、机器人、用量统计、维基、确认对话框、进程监控。

有意不翻译：main process 对话框（关于、托盘）与 CLI——属于独立语料；`Agent`、`MCP`、`GLM`——按术语表保留的英文技术术语。

---

## 更新后重新构建

ZCode 更新后补丁会被覆盖。针对新版本重新构建：

```bash
npm install
node scripts/extract.mjs        # 从已安装版本提取 en+zh 语料
node scripts/check.mjs --strict # 查看变化
node scripts/build.mjs          # build/app-ru.asar
bash tools/apply.sh             # 安装（会自动等待应用关闭）
```

---

## 兼容性

| 参数 | 数值 |
| --- | --- |
| ZCode | 3.10.1（build 6272） |
| 操作系统 | macOS（arm64） |
| Electron | 41.x |
| 依赖 | `@electron/asar`（通过 npm 本地安装） |

---

## 参与贡献

欢迎 PR，尤其是：

- 翻译改进（`dict/ru/*.json`）
- 适配新版 ZCode 的补丁点
- main process 与 CLI 的本地化

```bash
git clone https://github.com/warment/zcode-ru.git
cd zcode-ru && npm install
# 编辑 dict/ru/*.json
node scripts/check.mjs --strict && node scripts/build.mjs
bash tools/apply.sh   # 在 ZCode 中验证
```

---

## English

Unofficial community pack adding a **native third locale (`ru-RU`)** to the ZCode desktop app (macOS, 3.10.1): **5,018 UI strings — 100% of the renderer corpus**, third entry in the language selector (System / English / Русский), English fallback for new upstream strings.

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/warment/zcode-ru/v2.0.0/tools/install.sh)
```

Restore: `bash install.sh --restore`. See [SAFETY.md](./SAFETY.md) for risks. Not affiliated with Z.ai — see [THIRD_PARTY_NOTICES.md](./THIRD_PARTY_NOTICES.md).

---

<p align="center">
  <sub>为俄语开发者社区制作</sub><br>
  <sub>ZCode — <a href="https://zcode.z.ai">zcode.z.ai</a></sub>
</p>
