---
to: 'web/next.config.js'
inject: true
before:const nextConfig = {
---

let i18nConfig
try {
	i18nConfig = require('./src/i18n/config.js')
} catch (e) {
	console.log('*** i18n not enabled for this project')
}
const webpackCopyPagesToLanguages = require('./src/i18n/webpackCopyPagesToLanguages')
