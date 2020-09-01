---
inject: true
to: web/src/sections/sections.js
after: //add imports below
---
    <%= name %>: require('~/sections/<%= name %>'),