import axios from 'axios'

export default function updatePlaylistImage({ img, playlistID, accessToken }) {
	return axios({
		method: 'PUT',
		url: `${process.env.SPOTIFY_API_BASE}playlists/${playlistID}/images`,
		data: img,
		headers: {
			Authorization: `Bearer ${accessToken}`,
			'Content-Type': 'image/jpeg'
		}
	})
}
