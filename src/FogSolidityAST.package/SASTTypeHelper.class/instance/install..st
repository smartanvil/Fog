as yet unclassified
install: aType
	(types includesKey: aType name)
		ifTrue: [ aType isElementaryType
				ifTrue: [ self assert: aType = (types at: aType name) ]
				ifFalse: [ self error: 'Type already registered' ] ].
	types at: aType name put: aType.
	^ aType