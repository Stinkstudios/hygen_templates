---
to: netlify.toml
---
[build]
  ignore = "git diff --quiet HEAD^ HEAD ."
  command = "DEPLOY_ENV=development npm run build"
  functions = "publish_functions"
  publish = "out"
[build.environment]
  DEFAULT_DATA_SOURCE = "json"
  DEPLOY_ENV = "development"
  IMAGE_PROVIDERS = ""

[secrets]
 
[context.production]
  command = "echo 'Production'; npm run prod"
  publish = "out"

[context.production.environment]
  URL = "https://example.com"
  DEPLOY_ENV = "production"
  SANITY_DATASET = "production"
  NODE_ENV = "production"

[context.stage]
  command = "echo 'Stage'; DEPLOY_ENV=stage npm run build"
  publish = "out"

[context.stage.environment]
  DEPLOY_ENV = "stage"
  URL = "https://stage--example.netlify.app"

[context.qa]
  command = "echo 'QA'; DEPLOY_ENV=qa npm run build"
  publish = "out"

[context.qa.environment]
  DEPLOY_ENV = "qa"
  PREVIEW = "false"
  URL = "https://qa--example.netlify.app"

[[plugins]]
  package = "@netlify/plugin-nextjs"

[[redirects]]
  from = "/*"
  to = "/404.html"
  status = 404
