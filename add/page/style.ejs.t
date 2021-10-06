---
to: "<%= (pageType === 'dynamic') ? `src/pages/[${name}]/${name}.module.scss` : `src/pages/${name}/${name}.module.scss` %>"
unless_exists: true
---
.p-<%=name %> {
	position: static
}