---
to: 'next.config.js'
inject: true
after: 	env,
skip_if: target: process.env.DEPLOY_ENV === 'production' ? 'server' : 'serverless', // NOTE: for netlify
---
	target: process.env.DEPLOY_ENV === 'production' ? 'server' : 'serverless', // NOTE: for netlify