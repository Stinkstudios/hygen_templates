---
inject: true
to: src/pages/index.jsx
after: const sections = {
---
    <%= name %>: require('~/sections/<%= name %>'),