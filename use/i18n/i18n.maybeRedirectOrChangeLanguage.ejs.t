---
to: 'src/i18n/maybeRedirectOrChangeLanguage.js'
---
import i18next from './i18next'
import i18nConfig from './config'

const isLangRoute = (pathLang) => i18nConfig.locales.includes(pathLang)
const pathLangAndI18nMatch = (lng, pathLang) => lng === pathLang

const maybeRedirectOrChangeLanguage = (router) => {
	const pathLang = (router.asPath.length) ? router.asPath.split('/')[1] : ""
	if(
		!isLangRoute(pathLang) && 
		i18next.languages[0] !== i18next.options.fallbackLng[0]
	) {
		const path = router.asPath === "/" ? "" : router.asPath;
		router.push(`${i18next.languages[0]}${path}`)
	}
	if(!pathLangAndI18nMatch(i18next.languages[0], pathLang)) i18next.changeLanguage(pathLang)
}

export default maybeRedirectOrChangeLanguage