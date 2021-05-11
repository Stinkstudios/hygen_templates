---
inject: true
to: 'src/data/json/pages/index.js'
after: const pages = {
---
    <%= name %>: require('./<%= name %>'),