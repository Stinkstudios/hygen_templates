---
inject: true
to: 'data-interface/json/pages/index.js'
after: const pages = {
---
    <%= name %>: require('./<%= name %>'),