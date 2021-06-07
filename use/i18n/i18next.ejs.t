---
to: 'src/i18n/i18next.js'
---
import i18next from 'i18next'
import LanguageDetector from 'i18next-browser-languagedetector'
import { initReactI18next } from 'react-i18next'

const i18nConfig = require('./config')
const resources = {}
i18nConfig.locales.forEach((l) => resources[l] = { translation: { key: 'value' } })

i18next
	.use(LanguageDetector)
	.use(initReactI18next)
	.init({
		detection: {
			order: ['path', 'localStorage', 'navigator']
		},
		fallbackLng: i18nConfig.defaultLocale,
		resources,
		supportedLngs: i18nConfig.locales,
		nonExplicitSupportedLngs: <%= specificLanguages ? false : true %>,
		load: '<%= specificLanguages ? 'all' : 'languageOnly' %>', // 'languageOnly' matches en-US to en.  This should vary from project to project as sometimes a more naive translation approach is preferred, sometimes the same base language must vary between regions.  Comment out for codes to be matched specifically, but beware that en-US will no longer match en.
		interpolation: {
			escapeValue: false // not needed for react!!
		},
		react: {
			wait: true
		}
	})

export default i18next
