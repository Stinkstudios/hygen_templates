---
to: 'src/pages/<%= name %>/<%= name %>.module.sass'
unless_exists: true
---
.p-<%=name %>
	height: 100%
	@include at(laptop)
		background: red
