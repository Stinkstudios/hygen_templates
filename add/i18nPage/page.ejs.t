---
to: src/pages/<%=name%>/index.jsx
unless_exists: true
---
import { useTranslation } from 'react-i18next'
import { getResourceBundle, addResourceBundle } from 'i18next'
const i18nConfig = require('~/i18n/config')
const setupI18nForPage = (data) => {
	if(!getResourceBundle(i18nConfig.defaultLocale, '<%=name%>'))
		addResourceBundle(i18nConfig.defaultLocale, '<%=name%>', data);
	return useTranslation('<%=name%>')
}

export const getStaticProps = async props => {
	const DataInterface = require('~/data')
	const data = await DataInterface.fetch({ type: 'pages', args: {name: '<%= name %>' }})
	return {
		props: {
			data
		}
	}
}

import CSS from './<%= name %>.module.sass'


const <%= Name %> = ({ data }) => {
	const {t, i18n} = setupI18nForPage(data)
	return (
		<div className={`${CSS['p-<%= name %> ']}`}>
			<div><%= name %> </div>
		</div>
	)
}

<%= Name %>.displayName = '<%= Name %> '
<%= Name %>.layout = 'default'

export default <%= Name %> 



