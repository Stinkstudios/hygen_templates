---
to: "./src/data/json/pages/home__i18nExample.js"
---
const data = {
	en: {
		key: 'value',
		HOME: 'Home'
	}
}
const home = (args) => data[args.language] || data.en

module.exports = home
