import axios from 'axios'

export default function sendPlaylistCreationConfirmation({ endpoint = '', data, accessToken }) {
	const axiosOptions = {
		method: 'post',
		url: endpoint,
		headers: {
			Authorization: `Bearer ${accessToken}`,
			'Content-Type': 'application/json'
		},
		data
	}

	return axios(axiosOptions)
}
