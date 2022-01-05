---
to: "<%= locals.pageName ? `src/components/_pages/${pageName}/${name}/${name}.jsx` : `src/components/${name}/${name}.jsx` %>"
unless_exists: true
---
import CSS from './<%= name %>.module.scss'

const <%= Name %> = () => {
	return <div className={CSS.<%= name %>}><%= Name %></div>
}

export default <%= Name %>
