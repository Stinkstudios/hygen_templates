---
inject: true
to: "<%= locals.pageName ? `src/components/_pages/${pageName}/index.js` : `src/components/components.js` %>"
append: true
---
export { default as <%= Name %> } from './<%= name %>'