as yet unclassified
addInto: aCollection node: aSASTEnumValue
	(aCollection includes: aSASTEnumValue)
		ifTrue: [ self error: ' twice the same value' ].
	^ aCollection add: aSASTEnumValue