---
to: netlify.toml
---

# Base configuration
[build]
	base      = "web"
	ignore    = "git diff --quiet HEAD^ HEAD web"
	functions = "functions"
	command   = "echo 'Dev'; npm run prod"
	publish   = "out"
[build.environment]
	DATAINTERFACE_TYPE           = "json"
	DEPLOY_ENV                   = "development"
	SERVERLESS                   = "false"

[context.dev]
	command = "echo 'Dev'; npm run build; npm run netlify-serverless"
	publish = "public"
[context.dev.environment]
	SERVERLESS = "true"

[dev]
	functions = "web/functions"
	publish   = "web/public"
