---
to: 'next.config.js'
inject: true
after: \/\*\* CREATE ENV FROM CONFIG FILE \*\/
skip_if: readFileSync\('\.\/netlify\.toml'\)
---
/** NETLIFY */
const toml = require('@iarna/toml')
const parsedToml = toml.parse(readFileSync('./netlify.toml'))
const base = parsedToml.build.environment
Object.assign(parsedToml.build.environment, projectConfig)
writeFileSync('./netlify.toml', toml.stringify(parsedToml))
env = (process.env.NODE_ENV !== 'development') ? Object.assign(base, parsedToml.context[process.env.NODE_ENV].environment) : base