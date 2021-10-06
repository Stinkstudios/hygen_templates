---
to: "<%= (pageType === 'dynamic') ? `src/pages/[${name}]/${name}.module.sass` : `src/pages/${name}/${name}.module.sass` %>"
unless_exists: true
---
.p-<%=name %>
	position: static
