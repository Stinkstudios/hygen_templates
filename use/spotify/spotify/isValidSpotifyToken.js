import getMe from './getMe'

const isValidSpotifyToken = async token => {
	const me = await getMe({ accessToken: token })
	return me.type !== 'error'
}

export default isValidSpotifyToken
