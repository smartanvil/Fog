as yet unclassified
unpack: aString using: aFogPacker
	| tupleStream |
	tupleStream := aString readStream.
	^ self types
		inject: OrderedCollection new
		into: [ :acc :each | 
			| value |
			value := each isArrayType
				ifTrue: [ | arraySize location a b c |
					a := tupleStream next: 64.
					location := (aFogPacker unpackUint256: a) * 2.
					b := aString copyFrom: location + 1 to: location + 64.
					arraySize := (aFogPacker unpackUint256: b) * 2.
					c := aString copyFrom: location + 1 + 64 to: location + 64 + arraySize.
					each unpack: c using: aFogPacker ]
				ifFalse: [ each unpack: (tupleStream next: 64) using: aFogPacker ].
			acc add: value.
			acc ]