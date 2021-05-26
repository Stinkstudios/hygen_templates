import { getValueFromHash } from '~/helpers'
import { useEffect } from 'react'
const AuthCallback = ({ service, data }) => {
	useEffect(() => {
		const token = getValueFromHash(window.location.hash, 'access_token')
		const expiresIn = getValueFromHash(window.location.hash, 'expires_in')
		localStorage.setItem('spotifyToken', token)
		localStorage.setItem('spotifyToken_expiration', +new Date() + parseInt(expiresIn))
		window.location.href = data.config.auth_callback_path || '/'
	}, [service])

	return null
}

AuthCallback.layout = 'default'

export default AuthCallback
