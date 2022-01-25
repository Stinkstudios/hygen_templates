---
to: "<%= `data-interface/sanity/fragments/${name}.js` %>"
unless_exists: true
---
const <%= name %> = (name) => `${name}{
	
}`

export default <%= name %>
