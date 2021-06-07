const sanityClient = require('@sanity/client')
const params = {
	projectId: process.env.SANITY_PROJECT_ID,
	dataset: process.env.SANITY_DATASET,
	useCdn: process.env.DEPLOY_ENV === 'production',
	apiVersion: '2021-03-25'
}
if(process.env.DEPLOY_ENV !== 'production') params.token = process.env.SANITY_TOKEN

const client = params.projectId ? sanityClient(params) : null

module.exports = client
