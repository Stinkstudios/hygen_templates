---
to: web/src/components/<%= name %>/<%= name %>.jsx
unless_exists: true
---
import CSS from './<%= name %>.styl'
//import useAnalytics from '~/helpers/hooks/useAnalytics'
//import useBreakpoint from '~/helpers/hooks/useBreakpoint'

const <%= Name %> = ({ data, i18n }) => {
	//const analytics = useAnalytics()
	//const breakpoint = useBreakpoint()
	return (
		<div className={`${CSS['m-<%= name %>']} m-grid`}>
			<%= Name %>
		</div>
	)
}

export default <%= Name %>



