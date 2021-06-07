---
to: 'next.config.js'
inject: true
before: 'const nextConfig = {'
skip_if: const webpackCopyPagesToLanguages
---
/** i18N */
const webpackCopyPagesToLanguages = require('./src/i18n/webpackCopyPagesToLanguages')
