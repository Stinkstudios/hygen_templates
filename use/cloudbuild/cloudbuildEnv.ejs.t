---
to: next-config/envCloudBuild.js
---
const path = require('path')
const projectConfig = require('project-wide-config')
// eslint-disable-next-line prefer-const
let env = projectConfig.baseEnv

/** CREATE ENV FROM CONFIG FILE */
/** CLOUDBUILD */
const { readFileSync, writeFileSync } = require('fs')
const dotenv = require('dotenv')
const yaml = require('yaml')
const envFile = dotenv.config({ path: path.resolve(process.cwd(), `.env.local`) }).parsed

// Overwrite .env.local with project wide config in case of change, like changing the default data source
Object.assign(envFile, env)
Object.assign(env, envFile)
const envString = Object.keys(env).map((k) => `${k}=${env[k]}`).join('\n')
writeFileSync('.env.local', envString)
//Add properties to cloudbuild env.  Must recreate those env vars in the cloudbuild trigger
const parsedCloudBuild = yaml.parse(readFileSync('./cloudbuild.yaml', 'utf8'))
const stepWithEnv = parsedCloudBuild.steps.filter(s => s.env)[0]
stepWithEnv.env = ["GOOGLE_CLOUD_PROJECT=$PROJECT_ID", ...(Object.keys(env).map(e => `${e}=$_${e}`))]
writeFileSync('./cloudbuild.yaml', yaml.stringify(parsedCloudBuild))
//Assign values to env.  This is a necessary step for grabbing vars from Cloud Build and inserting them into webpack.
if(process.env.NODE_ENV === "production") ["GOOGLE_CLOUD_PROJECT", ...Object.keys(env)].forEach(k => env[k] = process.env[k])


/* ADD IMAGE PROVIDERS AUTOMATICALLY - DO NOT MODIFY */
// // eslint-disable-next-line prefer-const
// let imageProviders = ''
// /* ADD IMAGE PROVIDERS AUTOMATICALLY - HYGEN ANCHOR */
// if (imageProviders !== '') {
// 	env.IMAGE_PROVIDERS = imageProviders
// }

module.exports = env