const { Storage } = require('@google-cloud/storage')
// console.log(path.join(__dirname, './credentials.json'))
const storage = new Storage({ keyFilename: 'credentials.json' })

/**
 * HTTP function that generates a signed URL
 * The signed URL can be used to upload files to Google Cloud Storage (GCS)
 *
 * @param {Object} req Cloud Function request context.
 * @param {Object} res Cloud Function response context.
 */
exports.getSignedUrl = (req, res) => {
	res.set('Access-Control-Allow-Origin', '*')
	res.set('Access-Control-Allow-Methods', 'GET, POST')
	if (req.method === 'OPTIONS') {
		// Send response to OPTIONS requests
		res.set('Access-Control-Allow-Methods', 'POST')
		res.set('Access-Control-Allow-Headers', 'Content-Type')
		res.set('Access-Control-Max-Age', '3600')
		res.status(204).send('')
	}

	if (req.method !== 'POST') {
		return res.status(405).end()
	}
	// console.log(req.body)
	// Get a reference to the destination file in GCS
	const file = storage.bucket(req.body.bucket).file(req.body.filename)

	// Create a temporary upload URL
	const expiresAtMs = Date.now() + 300000 // Link expires in 5 minutes
	const config = {
		action: 'write',
		expires: expiresAtMs,
		contentType: req.body.contentType,
		version: 'v4'
	}

	file.getSignedUrl(config, (err, url) => {
		if (err) {
			// console.error(err)
			res.status(500).end()
			return
		}
		// console.log(url)
		res.send(url)
	})
}
