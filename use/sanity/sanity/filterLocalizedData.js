const filterLocalizedData = (data, language) => { 
    return Object.entries(data).map(e => {
        if(!e[1] || typeof e[1] !== 'object') return e
        if(e[1]._type === "localizedString") {
            e[0] = e[1].key
            e[1] = e[1][language] || "No translation"
            return e
        }
        if(Array.isArray(e[1]) && e[1][0]._type === "localizedString") { // We assume this is a dictionary if the first item is type 'localizedString'

            e[1] = e[1].reduce((map, item) => {
                map[item.key] = item[language]
                return map
            }, {})
            // e[1] = e[1].map(i => {
            //     if(i._type === "localizedString") {
            //         let obj = {}
            //         obj[i.key] = i[language] || "No translation"
            //         return obj
            //     }
            //     return i
            // })
            return e
        }
    })
    .reduce((map, item) => {
		map[item[0]] = item[1]
		return map
	}, {})
}

module.exports = filterLocalizedData