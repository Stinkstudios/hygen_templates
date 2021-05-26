---
to: netlify.toml
---
# Base configuration asdfasdff
[build]
	ignore    = "git diff --quiet HEAD^ HEAD web"
	command   = "npm run setup-serversideprops && npm run build && npm run next-on-netlify"
	publish   = "out_publish"
	functions = "out_functions"
[build.environment]
	DEPLOY_ENV                   = "development"
	DATAINTERFACE_TYPE			 = "json"
	IMAGE_PROVIDERS				 = ""
	URL                       	 = "https://dev--example.netlify.app"
	GA_ID         	 			 = "G-XXXXXXXXXX"

# Production branch
[context.production]
	command = "echo 'Production'; npm run prod"
	publish = "out"

[context.production.environment]
	URL                       = "https://example.com"
	DEPLOY_ENV                = "production"
	NODE_ENV                  = "production"

# Preview branch
[context.stage.environment]
	DEPLOY_ENV                = "stage"
	URL                       = "https://stage--example.netlify.app"

# QA branch
[context.qa]
	command = "echo 'QA'; npm run prod"
	publish = "out"
[context.qa.environment]
	DEPLOY_ENV                = "qa"
	PREVIEW                   = "false"
	URL                       = "https://qa--example.netlify.app"


[[plugins]]
package  = "netlify-plugin-cache-nextjs"

[[redirects]]
	from = "/*"
	to = "/404.html"
	status = 404


