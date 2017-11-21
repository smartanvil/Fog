testing
codeMatchesWith: aCode
	| addCode |
	addCode := aCode asAddress.
	^ binary = addCode or: [ runtime = addCode or: [ ( addCode size/(addCode minus: runtime) size ) asFloat < self similarityThreshold. ] ]