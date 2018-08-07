"
Array type marshal/unmarshal 
"
Class {
	#name : #FogArrayType,
	#superclass : #FogType,
	#instVars : [
		'inner'
	],
	#category : 'FogDB-Meta-Types'
}

{ #category : #accessing }
FogArrayType >> inner: anETHStructType [ 
	inner := anETHStructType
]

{ #category : #testing }
FogArrayType >> isArrayType [
	^ true 
]

{ #category : #testing }
FogArrayType >> mapping [
	^ FogSolidityArrayLayoutMapping
]

{ #category : #accessing }
FogArrayType >> name [
	^ inner name , '[]'.
]

{ #category : #marshaling }
FogArrayType >> pack: aCollection using: aFogPacker [
	| pack size |
	pack := aCollection inject: '' into: [ :acc :each | acc , (inner pack: each using: aFogPacker) ].
	size := 64 * (pack size // 64)
		+
			(pack size \\ 64 = 0
				ifTrue: [ 0 ]
				ifFalse: [ 64 ]).
	pack := pack padRightTo: size with: $0.
	^ (aFogPacker packUint256: aCollection size) , pack
]

{ #category : #marshaling }
FogArrayType >> staticSlotSize [
	^ 32
]

{ #category : #marshaling }
FogArrayType >> unpack: anArray using: aFogPacker [
	^ anArray collect: [ :chunk | inner unpackStream: chunk readStream using: aFogPacker ]
]

{ #category : #marshaling }
FogArrayType >> unpackReturn: aString using: aFogPacker [
	| stream ammount |
	stream := aString readStream.
	stream next: 64.
	ammount := aFogPacker unpackUint256: (stream next: 64).
	^ (1 to: ammount)
		collect:
			[ :i | inner unpack: (stream next: inner staticSlotSize * 2) using: aFogPacker ]
]
