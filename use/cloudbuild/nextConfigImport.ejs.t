---
to: 'next-config/index.js'
inject: true
after: let env = {}
---
env = require('./next-config/envCloudBuild')
