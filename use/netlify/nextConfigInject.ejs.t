---
to: 'next.config.js'
inject: true
after: \/\*\* CREATE ENV FROM CONFIG FILE \*\/
---

/** NETLIFY */
const toml = require('toml')
const parsedToml = toml.parse(readFileSync('./netlify.toml'))
const base = parsedToml.build.environment
env = (process.env.NODE_ENV !== 'development') ? Object.assign(base, parsedToml.context[process.env.NODE_ENV].environment) : base
