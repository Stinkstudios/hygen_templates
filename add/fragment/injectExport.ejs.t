---
inject: true
to: "<%= `data-interface/sanity/fragments/index.js` %>"
append: true
---
export { default as <%= name %> } from './<%= name %>'