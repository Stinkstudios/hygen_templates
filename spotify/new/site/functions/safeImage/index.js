exports.safeImage = async (req, res) => {
	res.set('Access-Control-Allow-Origin', '*')

	if (req.method === 'OPTIONS') {
		// Send response to OPTIONS requests
		res.set('Access-Control-Allow-Methods', 'GET')
		res.set('Access-Control-Allow-Headers', 'Content-Type')
		res.set('Access-Control-Max-Age', '3600')
		res.status(204).send('')
	}
	// console.log(req.body)
	if (req.method !== 'POST') {
		return res.status(405).end()
	}
	if (!req.body.imageURL) {
		return res.status(405).end()
	}
	// res.set('Access-Control-Allow-Origin', '*');
	// res.set('Access-Control-Allow-Methods', 'GET, POST');
	// if (req.method === 'OPTIONS') {
	//   // Send response to OPTIONS requests
	//   res.set('Access-Control-Allow-Methods', 'POST');
	//   res.set('Access-Control-Allow-Headers', 'Content-Type');
	//   res.set('Access-Control-Max-Age', '3600');
	//   res.status(204).send('');
	// }
	const vision = require('@google-cloud/vision')
	const client = new vision.ImageAnnotatorClient()
	// console.log(client)

	// Performs label detection on the image file
	const [result] = await client.safeSearchDetection(req.body.imageURL)
	// res.send("dogsman catstein")
	res.send({ results: result.safeSearchAnnotation })
	// console.log(result.safeSearchAnnotation)
	// const detections = result.safeSearchAnnotation;
	// res.send(result.safeSearchAnnotation.adult)
}
