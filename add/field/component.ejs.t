---
to: "<%= `data-interface/sanity/fields/${name}.js` %>"
unless_exists: true
---
const <%= name %> = () => `
	
`

export default <%= name %>
