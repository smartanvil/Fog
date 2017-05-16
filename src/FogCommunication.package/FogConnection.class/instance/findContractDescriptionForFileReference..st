access db - contract
findContractDescriptionForFileReference: aFileReference
	| compiled |
	compiled := (self findFileContractDescriptionByFileReference: aFileReference) ifNil: [ self findFileContractDescriptionForCompilationOutput: (self compileSolidity: aFileReference) ].
	compiled fromFile: aFileReference.
	^ compiled