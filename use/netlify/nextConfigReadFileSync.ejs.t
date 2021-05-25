---
inject: true
to: 'next.config.js'
at_line: 0
skip_if: readFileSync
---
const { readFileSync } = require('fs')
