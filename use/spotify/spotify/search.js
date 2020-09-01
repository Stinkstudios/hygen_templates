import axios from 'axios'

const spotifyApiBase = 'https://api.spotify.com/v1/'
// const spotifyEndpointMaxRetries = 4

export default function search({ text, accessToken }) {
	const axiosOptions = {
		method: 'get',
		url: `${spotifyApiBase}search?q=${encodeURIComponent(text)}&type=track`,
		headers: {
			Authorization: `Bearer ${accessToken}`,
			'Content-Type': 'application/json'
		}
	}
	return axios(axiosOptions)
}
