---
to: "<%= `data-interface/sanity/queries/${name}.js` %>"
unless_exists: true
---
const <%= name %> = () => `*[_type=="<%= name %>"][0]{
	
}`

export default <%= name %>
