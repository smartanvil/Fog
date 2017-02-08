as yet unclassified
unpack: aString using: aFogPacker
	| tupleStream bytes |
	tupleStream := aString readStream.
	"	sel Unknown input at end ->f assert: (aFogPacker unpackUint256: (tupleStream next: 64)) = 1.
	bytes := aFogPacker unpackUint256: (tupleStream next: 64).
	tupleStream := (tupleStream next: bytes * 2) readStream."
	^ types
		inject: OrderedCollection new
		into: [ :acc :each | 
			| value |
			value := each isArray
				ifTrue: [ | arraySize location |
					self halt.
					location := (aFogPacker unpackUint256: (tupleStream next: 64)) * 2.
					arraySize := (aFogPacker unpackUint256: (aString copyFrom: location + 1 to: location + 64))
						* 2.
					each
						unpack: (aString copyFrom: location + 1 + 64 to: location + 64 + arraySize)
						using: aFogPacker ]
				ifFalse: [ each consume: tupleStream using: aFogPacker ].
			acc add: value.
			acc ]