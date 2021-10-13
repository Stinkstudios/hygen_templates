const path = require('path')
const { readdirSync } = require('fs')
const pageOptions = readdirSync(path.join(process.cwd(), 'src/pages'), { withFileTypes: true })
	.filter((dirent) => dirent.isDirectory())
	.map((dirent) => dirent.name)

module.exports = {
	prompt: ({ prompter, args }) =>
		prompter
			.prompt({
				type: 'select',
				name: 'componentType',
				message: 'Is this a reused component or a page specific one?',
				choices: ['reusable', 'page']
			})
			.then(({ componentType }) => {
				if (componentType === 'page') {
					return prompter.prompt({
						type: 'select',
						name: 'pageName',
						message: 'Which page is it?',
						choices: pageOptions
					})
				}
			})
}
