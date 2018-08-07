"
Enum type marshal/unmarshal 
"
Class {
	#name : #FogEnumType,
	#superclass : #FogType,
	#instVars : [
		'values'
	],
	#category : 'FogDB-Meta-Types'
}

{ #category : #accessing }
FogEnumType >> name [ 
	^ 'enum'
]

{ #category : #marshaling }
FogEnumType >> pack: aValue using: aFogPacker [
	^ aFogPacker packUint8: (values indexOf: aValue) - 1
]

{ #category : #accessing }
FogEnumType >> signatureName [ 
	^ 'uint8'
]

{ #category : #marshaling }
FogEnumType >> staticSlotSize [
	^ 1 
]

{ #category : #marshaling }
FogEnumType >> unpack: aString using: anETHPacker [
	^ values at: (anETHPacker unpackUint8: aString) + 1
]

{ #category : #marshaling }
FogEnumType >> unpackStream: aReadStream using: aFogPacker [
	^ self unpack: (aReadStream next: self staticSlotSize * 2) using: aFogPacker
]

{ #category : #accessing }
FogEnumType >> values: aCollection [ 
	values := aCollection
]
