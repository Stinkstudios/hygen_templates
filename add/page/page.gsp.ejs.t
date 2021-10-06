---
to: "<%= (pageType === 'dynamic') ? `src/pages/[${name}]/${name}.gsp.js` : `src/pages/${name}/${name}.gsp.js` %>"
unless_exists: true
---

export const getStaticProps = async () => {
	const DataInterface = require('~/data')
	const data = await DataInterface.fetch({ type: 'page', args: { name: '<%= name %>' } })
	return {
		props: {
			data
		}
	}
}
<% if (pageType === "dynamic") { %> 
export const getStaticPaths = async () => {
	const DataInterface = require('~/data')
	const pages = await DataInterface.fetch({ type: '<%= name %>Slugs', dataType: 'json' })
	const paths = pages.map(page => {
		return {
			params: {
				<%= name %>Slug: page.slug
			}
		}
	})
	return {
		paths,
		fallback: false
	}
}
<% } %>