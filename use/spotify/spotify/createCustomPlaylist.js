import axios from 'axios'

import { defaultTracks } from '../defaultTracks'
import updatePlaylistImage from './updatePlaylistImage'
import sendPlaylistCreationConfirmation from './sendPlaylistCreationConfirmation'

const spotifyApiBase = 'https://api.spotify.com/v1/'
const spotifyEndpointMaxRetries = 4

export default async function createCustomPlaylist({
	accessToken,
	userID,
	title,
	data,
	img,
	tracks,
	confirmationEndpoint
}) {
	const dataForCustomTracks = JSON.parse(JSON.stringify(data))
	if (!tracks) {
		const response = await getCustomTracks({ accessToken, data: dataForCustomTracks })
		const { _tracks, fallback } = response.data
		tracks = _tracks
		if (fallback) {
			tracks = tracks.slice(0, 50).map(t => t.uri)
		}
	}

	if (tracks.length < 4) tracks = [...tracks, ...defaultTracks.slice(0, 10)]
	let playlist
	try {
		playlist = await createPlayList({ accessToken, userID, title })
	} catch (e) {
		return { error: true, message: e }
	}

	const externalURL = playlist.data.external_urls.spotify
	const playlistID = playlist.data.id

	await addTracks({ playlistID, tracks, accessToken })
	await updatePlaylistImage({ img, playlistID, accessToken })
	await sendPlaylistCreationConfirmation({
		endpoint: confirmationEndpoint,
		accessToken,
		data: {
			...data,
			playlist: playlistID
		}
	})
	// console.log(tracks)
	const tracksWithInfo = await getTracksInfo({ accessToken, tracks })
	// console.log(tracksWithInfo)
	return {
		playlistID,
		tracks: tracksWithInfo.data.tracks.map(track => {
			return {
				uri: track.uri,
				album: { images: [track.album.images[0]] },
				name: track.name,
				artists: [{ name: track.artists[0].name }]
			}
		}),
		externalURL
	}
}

function getTracksInfo({ accessToken, tracks }) {
	const aObj = {
		method: 'get',
		url: `${spotifyApiBase}tracks?ids=${tracks.map(t => t.split('spotify:track:')[1]).join(',')}`,
		headers: {
			Authorization: `Bearer ${accessToken}`,
			'Content-Type': 'application/json'
		}
	}
	return axios(aObj)
}

function getCustomTracks({ accessToken, data }) {
	let retries = 0
	// console.log(process.env.SPOTIFY_CUSTOM_TRACKS_ENDPOINT)
	const axiosOptions = {
		method: 'post',
		url: process.env.SPOTIFY_CUSTOM_TRACKS_ENDPOINT,
		headers: {
			Authorization: `Bearer ${accessToken}`,
			'Content-Type': 'application/json'
		},
		data
	}
	return new Promise(resolve => {
		function tryCreate() {
			axios(axiosOptions)
				.then(resolveResult)
				.catch(handleError)
		}
		function resolveResult(response) {
			// console.log(response)
			resolve({
				data: {
					tracks: response.data.tracks
				}
			})
		}
		function handleError() {
			// console.log('custom playlist error', retries, process.env.SPOTIFY_API_MAX_RETRIES)
			if (retries < parseInt(spotifyEndpointMaxRetries)) {
				retries++
				setTimeout(tryCreate, 500)
			} else {
				// console.log('using default tracks')
				resolve({
					data: {
						tracks: defaultTracks,
						fallback: true
					}
				})
			}
		}
		tryCreate()
	})
}

function createPlayList({ userID, accessToken, title }) {
	return axios({
		method: 'post',
		url: `${spotifyApiBase}users/${userID}/playlists`,
		headers: {
			Authorization: `Bearer ${accessToken}`,
			'Content-Type': 'application/json'
		},
		data: {
			name: title,
			public: false,
			collaborative: false
		}
	})
}

function addTracks({ playlistID, tracks, accessToken }) {
	return axios({
		method: 'post',
		url: `${spotifyApiBase}playlists/${playlistID}/tracks`,
		headers: {
			Authorization: `Bearer ${accessToken}`,
			'Content-Type': 'application/json'
		},
		data: { uris: tracks }
	})
}
