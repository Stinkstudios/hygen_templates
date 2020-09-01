export default function getLoginURL(redirectURI, scope) {
	const baseURL = 'https://accounts.spotify.com/authorize'
	const clientID = process.env.SPOTIFY_CLIENTD_APP
	const responseType = 'token'
	const host = typeof window !== 'undefined' ? window.location.origin : ''
	const encodedURI = encodeURIComponent(host + redirectURI)
	return `${baseURL}?client_id=${clientID}&response_type=${responseType}&redirect_uri=${encodedURI}&scope=${scope}`
}
