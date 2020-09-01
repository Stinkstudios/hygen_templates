import axios from 'axios'
const SPOTIFY_API_BASE = 'https://api.spotify.com/v1/'

export default function getMe({ accessToken }) {
	return new Promise(resolve => {
		return axios({
			method: 'get',
			url: `${SPOTIFY_API_BASE}me`,
			headers: { Authorization: `Bearer ${accessToken}` }
		})
			.then(response => {
				resolve(response.data)
			})
			.catch(() => {
				resolve({ type: 'error' })
			})
	})
}
