---
to: "<%= (pageType === 'dynamic') ? `src/pages/[${name}]/index.jsx` : `src/pages/${name}/index.jsx` %>"
unless_exists: true
---
import CSS from './<%= name %>.module.sass'
export { getStaticProps<% if(pageType === "dynamic") { %>, getStaticPaths <% } %> } from './<%= name %>.gsp'

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
