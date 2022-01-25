---
to: "<%= locals.pageName ? `src/components/_pages/${pageName}/${name}/${name}.jsx` : `src/components/${name}/${name}.jsx` %>"
unless_exists: true
---
import PropTypes from 'prop-types'
import checkProps from '@jam3/react-check-extra-props'
import CSS from './<%= name %>.module.scss'

const <%= Name %> = ({ className }) => {
	return <div className={`${className} ${CSS.<%= name %>}`}><%= Name %></div>
}

<%= Name %>.propTypes = checkProps({
	className: PropTypes.string
})

<%= Name %>.defaultProps = {
	className: ''
}

export default <%= Name %>
