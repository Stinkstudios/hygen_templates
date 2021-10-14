---
to: next-config/envNetlify.js
---
/** NETLIFY */
const path = require('path')
const projectConfig = require('project-wide-config')
// eslint-disable-next-line prefer-const
let env = projectConfig.baseEnv

const dotenv = require('dotenv')
const envFile = dotenv.config({ path: path.resolve(process.cwd(), `.env.local`) }).parsed
Object.assign(env, envFile)

const { readFileSync, writeFileSync } = require('fs')
const toml = require('@iarna/toml')
const parsedToml = toml.parse(readFileSync('./netlify.toml'))
if (envFile) {
	const copiedEnv = JSON.parse(JSON.stringify(envFile))
	for (const key in copiedEnv) copiedEnv[key] = 'secret'
	parsedToml.secrets = copiedEnv
	writeFileSync('./netlify.toml', toml.stringify(parsedToml))
}

Object.assign(parsedToml.build.environment, env)
const base = parsedToml.build.environment
const deployEnv = process.env.DEPLOY_ENV || 'development'
env = deployEnv !== 'development' ? Object.assign(base, parsedToml.context[deployEnv].environment) : base

Object.keys(parsedToml.secrets).forEach((s) => {
	env[s] = process.env[s]
})


/* ADD IMAGE PROVIDERS AUTOMATICALLY - DO NOT MODIFY */
// // eslint-disable-next-line prefer-const
// let imageProviders = ''
// /* ADD IMAGE PROVIDERS AUTOMATICALLY - HYGEN ANCHOR */
// if (imageProviders !== '') {
// 	env.IMAGE_PROVIDERS = imageProviders
// }


module.exports = env