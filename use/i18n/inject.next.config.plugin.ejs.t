---
to: 'next-config/index.js'
inject: true
before: config\.module\.rules\.push
skip_if: webpackCopyPagesToLanguages\(config\)
---
		webpackCopyPagesToLanguages(config)
