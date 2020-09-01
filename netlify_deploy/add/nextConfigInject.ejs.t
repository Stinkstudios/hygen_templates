---
to: 'web/next.config.js'
inject: true
after: const { readFileSync } = require('fs')
---

const toml = require('toml')

config = toml.parse(readFileSync('../netlify.toml')).build.environment
if (process.env.NODE_ENV !== 'production') {
	const customConfig = toml.parse(readFileSync('../development.toml')).build.environment
	Object.assign(config, customConfig)
}
