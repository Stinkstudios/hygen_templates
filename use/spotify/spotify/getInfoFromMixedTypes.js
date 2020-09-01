// import axios from 'axios'
import getInfo from './getInfo'
// const spotifyApiBase = 'https://api.spotify.com/v1/'

const canQueryMultiples = type => {
	return type !== 'playlist' && type !== 'user'
}

/** NOTE:  This only needs to catch the __idx prop. but it can merge more.  It prioritizes the source entities info of course. */
const mergeResults = (target, source) => {
	return target.map(t => {
		return Object.assign(
			t,
			source.find(s => s.uri === t.uri)
		)
	})
}

function getInfoFromMixedTypes({ accessToken, entities }) {
	// console.log(entities)
	entities.forEach((e, idx) => {
		e.__idx = idx
	})
	const groupedForRequests = []
	entities.forEach(e => {
		const type = e.uri.split(':')[1]
		e.type = type
		const destination = groupedForRequests.find(g => g.find(i => i.type === type))
		if (!destination || !canQueryMultiples(type)) return groupedForRequests.push([e])
		destination.push(e)
	})
	let output = []
	return new Promise((resolve, reject) => {
		const getEntitiesInfo = async grouped => {
			const { data } = await getInfo({ accessToken, entities: grouped.map(e => e.uri), type: grouped[0].type })
			const entitiesWithInfo = data[grouped[0].type + 's'] ? data[grouped[0].type + 's'] : [data]
			output.push(...entitiesWithInfo)
			if (groupedForRequests.length) {
				getEntitiesInfo(groupedForRequests.shift())
			} else {
				output = mergeResults(output, entities)
				output = output.sort((a, b) => a.__idx - b.__idx)
				resolve(output)
			}
		}
		if (entities.length) getEntitiesInfo(groupedForRequests.shift())
	})
}

export default getInfoFromMixedTypes
