---
to: src/components/<%= name %>/<%= name %>.jsx
unless_exists: true
---
import CSS from './<%= name %>.module.sass'

const <%= Name %> = () => {
	return <div className={CSS.<%= name %>}><%= Name %></div>
}

export default <%= Name %>
