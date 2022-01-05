---
to: "<%= (pageType === 'dynamic') ? `data-interface/json/pages/${name}Slugs.js` : null %>"
---
const data = [
    {slug: 'slug1'},
    {slug: 'slug2'},
    {slug: 'dogs'},
]
const <%= name %>Slugs = args => data

module.exports = <%= name %>Slugs
