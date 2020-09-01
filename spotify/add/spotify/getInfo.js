import axios from 'axios'

const spotifyApiBase = 'https://api.spotify.com/v1/'

const canQueryMultiples = type => {
	return type !== 'playlist' && type !== 'user'
}

const getIDsQueryChunk = (type, e) => {
	return canQueryMultiples(type)
		? `?ids=${e.map(t => t.split(`spotify:${type}:`)[1]).join(',')}`
		: `/${e[0].split(`spotify:${type}:`)[1]}`
}

function getInfo({ accessToken, entities, type = 'track' }) {
	const idsQueryChunk = getIDsQueryChunk(type, entities)
	const aObj = {
		method: 'get',
		url: `${spotifyApiBase}${type}s${idsQueryChunk}`,
		headers: {
			Authorization: `Bearer ${accessToken}`,
			'Content-Type': 'application/json'
		}
	}
	return axios(aObj)
}

export default getInfo
