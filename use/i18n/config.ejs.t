---
to: 'src/i18n/config.js'
---
module.exports = {
	locales: <%- JSON.stringify(languages)%>,
	defaultLocale: '<%= defaultLanguage %>'
}
