---
to: 'next.config.js'
inject: true
after: \/\*\* CREATE ENV FROM CONFIG FILE \*\/
---

/** CLOUDBUILD */
const dotenv = require('dotenv')
const yaml = require('yaml')
env = dotenv.config({ path: path.resolve(process.cwd(), `.env.local`) }).parsed

//Overwrite .env.local with project wide config in case of change, like changing the default data source
Object.assign(env, projectConfig)
const envString = Object.keys(env).map((k) => `${k}=${env[k]}`).join('\n')
writeFileSync('.env.local', envString)
//Add properties to cloudbuild env.  Must recreate those env vars in the cloudbuild trigger
const parsedCloudBuild = yaml.parse(readFileSync('./cloudbuild.yaml', 'utf8'))
const stepWithEnv = parsedCloudBuild.steps.filter(s => s.env)[0]
stepWithEnv.env = ["GOOGLE_CLOUD_PROJECT=$PROJECT_ID", ...(Object.keys(env).map(e => `${e}=$_${e}`))]
writeFileSync('./cloudbuild.yaml', yaml.stringify(parsedCloudBuild))
//Assign values to env.  This is a necessary step for grabbing vars from Cloud Build and inserting them into webpack.
if(process.env.NODE_ENV === "production") ["GOOGLE_CLOUD_PROJECT", ...Object.keys(env)].forEach(k => env[k] = process.env[k])
