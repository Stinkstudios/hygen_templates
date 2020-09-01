import axios from 'axios'

const spotifyApiBase = 'https://api.spotify.com/v1/'
// const spotifyEndpointMaxRetries = 4

export default function getPlaylistImage({ playlistID, accessToken }) {
	return axios({
		method: 'get',
		url: `${spotifyApiBase}playlists/${playlistID}/images`,
		headers: {
			Authorization: `Bearer ${accessToken}`,
			'Content-Type': 'application/json'
		}
	})
}
