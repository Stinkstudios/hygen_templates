---

---
const path = require('path')
const CopyPlugin = require('copy-webpack-plugin')

const i18nConfig = require('./config')


const webpackCopyPagesToLanguages = (config) => {
	config.watchOptions.ignored = config.watchOptions.ignored.concat(i18nConfig.locales.map(l => `**/pages/${l}`))
	const internalPages = [
		'_app.jsx',
		'404.jsx',
		'500.jsx',
		'_document.jsx'
	]
	const filterInternalPages = async (resourcePath, languages) => (
		!internalPages.includes(resourcePath.split('/').pop()) &&
		languages.map( l => resourcePath.indexOf(`pages/${l}`) < 0).reduce((a,b) => a&&b)	
	)

	const convertRegularPageToLocalized = (language, content, absoluteForm) => {
		const contentString = content.toString()
		if(contentString.indexOf('getStaticProps') > -1) {
			let modifiedContentString = contentString.replace(/fetch.+\)/g, (match, $1) => {
                if(match.indexOf('language:') > -1) {
                    match = match.replace(/language:[^},]+/, `language: '${language}' `)
                } else if(match.indexOf('args:') > -1) {
                    match = match.replace(/args:[^{]{[^}]+}/, (_m) => _m.slice(0,-1)+`, language: '${language}' }`) 
                } else {
					match = match.replace(/{[^}]+}/, _m => _m.slice(0,-1)+`, args: { language: '${language}' }}`)
				}
				return match
			})
			modifiedContentString = modifiedContentString.replace(/(ResourceBundle\()([^,]+)/g, _m => `${_m.split('(')[0]}('${language}'`)
			return modifiedContentString
		} else {
			return content
		}
	}
	config.plugins.push(new CopyPlugin({
		patterns: i18nConfig.locales.map( language => {
			return { 
				from: "./src/pages", 
				filter: async (resourcePath) => { return await filterInternalPages(resourcePath, i18nConfig.locales) },
				to: path.join(process.cwd(), `src/pages/${language}/`),
				transform: (content, absoluteForm) => { 
					return convertRegularPageToLocalized(language,content, absoluteForm ) 
				}	
			}
		})
	}))
}

module.exports = webpackCopyPagesToLanguages