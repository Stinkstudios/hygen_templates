---
to: 'next.config.js'
inject: true
after: let env = {}
---
const env = require('./next-config/envCloudBuild')
