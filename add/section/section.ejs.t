---
to: web/src/sections/<%= name %>/<%= name %>.jsx
unless_exists: true
---
import CSS from './<%= name %>.styl'

const <%= Name %> = ({ data, i18n, send }) => (
	<div className={`${CSS['m-<%= name %>']} m-grid`}>
    
	</div>
)

export default <%= Name %>



