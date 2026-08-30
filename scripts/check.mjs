#!/usr/bin/env node
// Валидатор словаря: полнота ключей, плейсхолдеры в обе стороны, мусор в значениях.
// Использование: node scripts/check.mjs [--strict] [--corpus путь] [--dict папка]
// Exit 1 — ошибки (или --strict и есть непереведённые ключи).
import { readdirSync, readFileSync, existsSync } from 'node:fs';
import { dirname, join } from 'node:path';
import { fileURLToPath } from 'node:url';

const ROOT = join(dirname(fileURLToPath(import.meta.url)), '..');
const args = process.argv.slice(2);
const strict = args.includes('--strict');
const get = (flag, def) => { const i = args.indexOf(flag); return i >= 0 ? args[i + 1] : def; };
const corpusPath = get('--corpus', join(ROOT, 'upstream/corpus.json'));
const dictDir = get('--dict', join(ROOT, 'dict/ru'));

if (!existsSync(corpusPath)) { console.error(`нет корпуса: ${corpusPath}`); process.exit(1); }
const corpus = JSON.parse(readFileSync(corpusPath, 'utf8'));
const corpusKeys = new Set(Object.values(corpus).flatMap(ns => Object.keys(ns)));

const placeholders = s => [...String(s).matchAll(/\{[^{}]+\}/g)].map(m => m[0]);
const ph = s => placeholders(s).sort().join('|');
const errors = [], warnings = [];
const dict = {}; // key -> value
const files = existsSync(dictDir) ? readdirSync(dictDir).filter(f => f.endsWith('.json')).sort() : [];

for (const f of files) {
  const data = JSON.parse(readFileSync(join(dictDir, f), 'utf8'));
  let ok = 0;
  for (const [k, v] of Object.entries(data)) {
    if (!corpusKeys.has(k)) { errors.push(`${f}: ключ не из корпуса: ${k}`); continue; }
    const src = Object.values(corpus).find(ns => k in ns)?.[k];
    if (typeof v !== 'string' || (!v.trim() && src && src.en.trim())) { errors.push(`${f}: пустое значение: ${k}`); continue; }
    if (/[\u4e00-\u9fff]/.test(v)) { errors.push(`${f}: иероглифы в значении: ${k}`); continue; }
    if (/"[^"]*"/.test(v.replace(/\\"/g, ''))) warnings.push(`${f}: прямые кавычки: ${k}`);
    if (src && src.en.trim()) {
      if (ph(v) !== ph(src.en)) errors.push(`${f}: плейсхолдеры en[${ph(src.en)}] != ru[${ph(v)}]: ${k}`);
      if (v === src.en) warnings.push(`${f}: значение = en (не переведено?): ${k}`);
    }
    if (k in dict) errors.push(`дубликат ключа ${k} (уже в другом файле)`);
    dict[k] = v;
    ok++;
  }
  (globalThis._stat ??= []).push([f, ok]);
}
const missing = [...corpusKeys].filter(k => !(k in dict));

// сводка
const stat = globalThis._stat ?? [];
const total = stat.reduce((s, [, n]) => s + n, 0);
console.log(`\nсловарь: ${files.length} файл(ов), ${total} ключей; корпус: ${corpusKeys.size}`);
for (const [f, n] of stat) console.log(`  ${f}: ${n}`);
if (missing.length) {
  console.log(`\nне переведено (${missing.length}):`);
  const byNs = {};
  for (const k of missing) { const ns = k.split('.').slice(0, 2).join('.'); (byNs[ns] ??= []).push(k); }
  for (const [ns, ks] of Object.entries(byNs).sort((a, b) => b[1].length - a[1].length).slice(0, 12))
    console.log(`  ${ns}: ${ks.length}`);
}
if (warnings.length) { console.log(`\nwarnings (${warnings.length}):`); warnings.slice(0, 20).forEach(w => console.log('  ~ ' + w)); }
if (errors.length) { console.log(`\nERRORS (${errors.length}):`); errors.slice(0, 30).forEach(e => console.log('  ! ' + e)); }

if (errors.length || (strict && missing.length)) {
  console.log(`\nFAIL (${errors.length} ошибок${strict ? `, ${missing.length} непереведённых` : ''})`);
  process.exit(1);
}
console.log(strict && !missing.length ? '\nPASS (strict): корпус покрыт на 100%' : '\nPASS');
