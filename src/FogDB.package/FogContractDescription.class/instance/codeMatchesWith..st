testing
codeMatchesWith: aCode
	| addCode |
	addCode := aCode asAddress.
	^ binary = addCode or: [ runtime = addCode or: [ ((addCode minus: runtime) size / addCode size) asFloat < self similarityThreshold. ] ]