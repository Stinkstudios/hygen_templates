---
to: 'web/next.config.js'
inject: true
after: \/\*\* CREATE ENV FROM CONFIG FILE \*\/
---

/** NETLIFY */
const toml = require('@iarna/toml')
const parsedToml = toml.parse(readFileSync('./netlify.toml'))
Object.assign(parsedToml.build.environment, env)
const base = parsedToml.build.environment
const deployEnv = process.env.DEPLOY_ENV || "development"
env = (deployEnv !== "development") ?
			Object.assign(base, parsedToml.context[deployEnv].environment) :
			base;
