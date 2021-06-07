import * as queries from './queries'
import client from './_lib/client'

import filterLocalizedData from './filterLocalizedData'

const sanityRequest = async (request) => {
	// eslint-disable-next-line no-console
	if(!client) {
		console.log('SANITY CLIENT IS MISSING CONSTRUCTOR PARAMS')
		return {}
	}
	if (!queries[request.type]) return console.log(`NO QUERIES ARE AVAILABLE FOR TYPE: ${request.type}`)
	// eslint-disable-next-line no-console
	if (typeof queries[request.type] !== 'function') return console.log(`${request.type} QUERY IS NOT A FUNCTION`)
	const query = queries[request.type](request.args)
	if (query) {
		let result = await client.fetch(query, request.params)
		if(!result || result.length < 1) {
			console.log(query)
			console.log('RESULT OF QUERY IS EMPTY.  PLEASE CHECK THAT THE DATASET IS NOT PRIVATE OR THAT YOUR HAVE THE API TOKEN')
			return null
		}
		if(request.language) result = filterLocalizedData(result, request.language)
		return result
	}
	return null
}

module.exports = sanityRequest
