---
to: src/components/<%= name %>/<%= name %>.jsx
unless_exists: true
---
import CSS from './<%= name %>.module.sass'
const <%= Name %> = ({ data }) => {
	return (
		<div className={`${CSS['m-<%= name %>']} m-grid`}>
			<%= Name %>
		</div>
	)
}

export default <%= Name %>



