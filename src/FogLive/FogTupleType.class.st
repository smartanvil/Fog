"
Tuple reifies the idea of bunch of types. Used for encoding parameters for method activation, and multiple return 
"
Class {
	#name : #FogTupleType,
	#superclass : #FogType,
	#instVars : [
		'types'
	],
	#category : 'FogDB-Meta-Types'
}

{ #category : #accessing }
FogTupleType >> associations [
	^ types
]

{ #category : #accessing }
FogTupleType >> name [
	^ ',' join: (self types collect: #name)
]

{ #category : #pack }
FogTupleType >> pack: aCollection with: aFogPacker [
	| staticStream dynamicStream staticSize | 
	self assert: aCollection size = self types size.
	staticStream := '' writeStream.
	dynamicStream := '' writeStream.
	staticSize := self staticSlotSize.
	self types
		with: aCollection
		do: [ :type :value | 
			type isArrayType
				ifTrue: [ 
					staticStream nextPutAll: (aFogPacker packUint256: staticSize + (dynamicStream position / 2)).
					dynamicStream nextPutAll: (type pack: value using: aFogPacker) 
				]
				ifFalse: [ staticStream nextPutAll: ((type pack: value using: aFogPacker) padLeftTo: 64 with: $0) ] ].
	^ staticStream contents , dynamicStream contents
]

{ #category : #accessing }
FogTupleType >> signatureName [
	^ ',' join: (self types collect: #signatureName)
]

{ #category : #accessing }
FogTupleType >> size [
	^ types size 
]

{ #category : #marshaling }
FogTupleType >> staticSlotSize [
	^ self types size * 32 
]

{ #category : #accessing }
FogTupleType >> types [
	^ types collect: #value
]

{ #category : #accessing }
FogTupleType >> types: aCollectionOfTypes [
	types := aCollectionOfTypes
]

{ #category : #marshaling }
FogTupleType >> unpack: aString using: aFogPacker [
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
]

{ #category : #accessing }
FogTupleType >> variables [
	^ types collect: #key
]
