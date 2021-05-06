---
to: 'web/next.config.js'
inject: true
after: \/\*\* CREATE ENV FROM CONFIG FILE \*\/
---

/** CLOUDBUILD */
const dotenv = require('dotenv')
const yaml = require('yaml')
const env = dotenv.config({ path: path.resolve(process.cwd(), `.env.local`) }).parsed
const parsedCloudBuild = yaml.parse(readFileSync('./cloudbuild.yaml', 'utf8'))
const stepWithEnv = parsedCloudBuild.steps.filter(s => s.env)[0]
stepWithEnv.env = ["GOOGLE_CLOUD_PROJECT=$PROJECT_ID", ...(Object.keys(env).map(e => `${e}=$_${e}`))]
writeFileSync('./cloudbuild.yaml', yaml.stringify(parsedCloudBuild))
if(process.env.NODE_ENV === "production") ["GOOGLE_CLOUD_PROJECT", ...Object.keys(env)].forEach(k => env[k] = process.env[k])


