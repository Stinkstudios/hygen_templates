---
inject: true
to: "<%= `data-interface/sanity/fields/index.js` %>"
append: true
---
export { default as <%= name %> } from './<%= name %>'