---
to: 'web/next.config.js'
inject: true
before:webpack: config => {
---

if(i18nConfig) webpackCopyPagesToLanguages(config)