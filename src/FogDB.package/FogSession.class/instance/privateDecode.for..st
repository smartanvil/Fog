contract - remote activation
privateDecode: aReturnValue for: aMethodMirror
	| process |
	aReturnValue = '0x'
		ifTrue: [ self error: 'Empty return!' ].
	process := aReturnValue copyFrom: 3 to: aReturnValue size.
	^ aMethodMirror returnType unpackReturn: process using: FogHexadecimalPacker new