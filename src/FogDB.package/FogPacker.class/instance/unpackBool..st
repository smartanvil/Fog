as yet unclassified
unpackBool: aString
	| value |
	value := self unpackUint8: aString.
	value = 0
		ifTrue: [ ^ false ].
	value = 1
		ifTrue: [ ^ true ].
	self error: 'Unexpected boolean representation: ' , aString