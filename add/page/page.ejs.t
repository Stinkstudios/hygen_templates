---
to: src/pages/<%=name%>/index.jsx
unless_exists: true
---
import CSS from './<%= name %>.module.sass'

export const getStaticProps = async (props) => {
	const DataInterface = require('~/data')
	const data = await DataInterface.fetch({ type: 'page', args: { name: '<%= name %>' }})
	return {
		props: {
			data
		},
		revalidate: process.env.DEPLOY_ENV !== 'production' ? 5 : false
	}
}

const <%= Name %> = () => {
	return (
		<div className={`${CSS['p-<%= name %> ']}`}>
			<div><%= name %> </div>
		</div>
	)
}

<%= Name %>.displayName = '<%= Name %> '
<%= Name %>.layout = 'default'

export default <%= Name %>
