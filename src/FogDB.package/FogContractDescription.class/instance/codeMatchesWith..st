testing
codeMatchesWith: aCode
	| addCode |
	addCode := aCode asAddress.
	^ binary = addCode or: [ runtime = addCode ]