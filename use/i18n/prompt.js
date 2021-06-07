module.exports = [
	{
		type: 'list',
		name: 'languages',
		message: 'What are the available languages?'
	},
	{
		type: 'input',
		name: 'defaultLanguage',
		message: 'What is the default language?'
	},
	{
		type: 'confirm',
		name: 'specificLanguages',
		message: 'Will this project need language specificity (i.e. fr-CA vs fr)?'
	}
]
