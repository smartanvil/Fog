access db - contract
findContractDescriptionForFileReference: aFileReference
	| compiled |
	compiled := (self findFileContractDescriptionByFileReference: aFileReference) ifNil: [ self compileSolidity: aFileReference ].
	compiled fromFile: aFileReference.
	^ compiled