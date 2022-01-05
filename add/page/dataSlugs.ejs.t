---
to: "<%= (pageType === 'dynamic') ? `data-interface/json/pages/${name}Slugs.js` : null %>"
---
const data = [
    'slug1',
    'slug2'
]
const <%= name %>Slugs = args => data

module.exports = <%= name %>Slugs
