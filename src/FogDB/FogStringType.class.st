"
Reifies the string type
"
Class {
	#name : #FogStringType,
	#superclass : #FogType,
	#category : 'FogDB-Meta-Types'
}

{ #category : #testing }
FogStringType >> isArrayType [
	^ true
]

{ #category : #marshaling }
FogStringType >> mapping [
	^ FogSolidityStringLayoutMapping
]

{ #category : #accessing }
FogStringType >> name [
	^ #string
]

{ #category : #marshaling }
FogStringType >> pack: aString using: aFogPacker [
	| pack size |
	
	" it writes the size if this size is smaller than 64. If not, it writes the location of the content into the stream, where it will write the lenght and the data ."
	pack := (ZnUTF8Encoder new encodeString: aString)
		inject: ''
		into: [ :acc :each | acc , each asHeadlessHexa ].
	size := 64 * (pack size // 64)
		+
			(pack size \\ 64 = 0
				ifTrue: [ 0 ]
				ifFalse: [ 64 ]).
	pack := pack padRightTo: size with: $0.
	^ (aFogPacker packUint256: aString size) , pack
]

{ #category : #marshaling }
FogStringType >> staticSlotSize [
	^ 32
]

{ #category : #marshaling }
FogStringType >> unpack: aString using: aFogPacker [
	| decoded |
	decoded := OrderedCollection new.
	1 to: aString size by: 2 do: [ :idx | 
		| code |
		code := ('16r'
			,
				{(aString at: idx).
				(aString at: idx + 1)}) asNumber.
		code = 0
			ifFalse: [ decoded add: code ] ].
	^ ZnUTF8Encoder new decodeBytes: decoded asByteArray
]

{ #category : #marshaling }
FogStringType >> unpackReturn: aString using: aFogPacker [
	| stream size |
	stream := aString readStream.
	stream next: 64.
	size := (aFogPacker unpackUint256: (stream next: 64)) * 2.
	^ self unpack: (stream next: size) using: aFogPacker
]
