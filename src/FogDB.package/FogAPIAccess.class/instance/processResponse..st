as yet unclassified
processResponse: aResponse
	" nothing yet "

	(aResponse includesKey: #error)
		ifTrue: [ Error signal: ('Remote Error: ({code}):{message}' format: (aResponse at: #error)) ]