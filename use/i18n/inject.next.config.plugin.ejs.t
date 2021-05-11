---
to: 'web/next.config.js'
inject: true
after: 'webpack: config => {'
---

        if(i18nConfig) webpackCopyPagesToLanguages(config)