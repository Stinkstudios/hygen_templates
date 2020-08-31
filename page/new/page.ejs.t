---
to: web/src/pages/<%=name%>/index.jsx
---
import { HTMLHead } from '~/components'
import DataInterface from '~/data'
import useAnalytics from '~/helpers/hooks/useAnalytics'
import useBreakpoint from '~/helpers/hooks/useBreakpoint'

import CSS from './<%=name%>.styl'

const <%= Name %> = ({ data, i18n, query }) => {
	const analytics = useAnalytics()
	const breakpoint = useBreakpoint()
	return (
		<div className={`${CSS['p-<%= name %> ']}`}>
			<HTMLHead></HTMLHead>
			<div><%= name %> </div>
		</div>
	)
}

<%= Name %>.displayName = '<%= Name %> '

<%= Name %>.layout = 'default'

export const getStaticProps = async props => {
	console.log(props)
	const data = await DataInterface.fetch({ page: '<%= name %>' })
	return {
		// ...pageProps,
		props: {
			data
		}
	}
}

export default <%= Name %> 



