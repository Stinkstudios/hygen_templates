---
to: 'next.config.js'
inject: true
after: 'webpack: config => {'
---
		webpackCopyPagesToLanguages(config)
