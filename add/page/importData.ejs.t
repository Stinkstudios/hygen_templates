---
inject: true
to: 'data-interface/json/pages/index.js'
after: const pages = {
---
    <%= name %>: require('./<%= name %>'),
    <% if(pageType === 'dynamic'){ -%>
    <%= name %>Slugs: require('./<%= name %>Slugs'),
    <% } -%>