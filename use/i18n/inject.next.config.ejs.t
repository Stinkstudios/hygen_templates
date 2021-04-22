---
to: 'web/next.config.js'
inject: true
before: 'const nextConfig = {'
---
/** i18N */
const webpackCopyPagesToLanguages = require('./src/i18n/webpackCopyPagesToLanguages')
