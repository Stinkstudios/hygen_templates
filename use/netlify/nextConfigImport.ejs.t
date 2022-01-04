---
to: 'next-config/index.js'
inject: true
after: Object.assign\(env, envFile\)
---
Object.assign(env, require('./envNetlify'))