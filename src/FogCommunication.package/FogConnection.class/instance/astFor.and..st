access db - contract
astFor: sourceCode and: solidityJsonAst
	^ self useJson
		ifTrue: [ solidityJsonAst ]
		ifFalse: [ SolidityParser parseStream: sourceCode readStream ]