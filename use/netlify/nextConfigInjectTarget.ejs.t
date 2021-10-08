---
to: 'next.config.js'
inject: true
after: 	const nextConfig = {
skip_if: const toml = require\('@iarna/toml'\)
---
	target: process.env.DEPLOY_ENV === 'production' ? 'server' : 'serverless', // NOTE: for netlify