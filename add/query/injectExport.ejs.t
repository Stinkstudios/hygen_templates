---
inject: true
to: "<%= `data-interface/sanity/queries/index.js` %>"
append: true
---
export { default as <%= name %> } from './<%= name %>'