as yet unclassified
decodeReturn: aReturnValue
	| process |
	aReturnValue = '0x'
		ifTrue: [ self error: 'Empty return!' ].
	process := aReturnValue copyFrom: 3 to: aReturnValue size.
	^ self returnType unpackReturn: process using: FogHexadecimalPacker new