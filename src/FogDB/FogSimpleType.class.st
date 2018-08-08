"
Simple type marshal/unmarshal 
"
Class {
	#name : #FogSimpleType,
	#superclass : #FogType,
	#instVars : [
		'name'
	],
	#category : 'FogDB-Meta-Types'
}

{ #category : #'as yet unclassified' }
FogSimpleType class >> named: aString [ 
	^ self new name: aString; yourself 
]

{ #category : #'as yet unclassified' }
FogSimpleType class >> sizeOfAddress [
	^ 20
]

{ #category : #'as yet unclassified' }
FogSimpleType class >> sizeOfBool [
	^ 1
]

{ #category : #'as yet unclassified' }
FogSimpleType class >> sizeOfInt [
	^ self sizeOfUint256
]

{ #category : #'as yet unclassified' }
FogSimpleType class >> sizeOfInt16 [
	^ 2
]

{ #category : #'as yet unclassified' }
FogSimpleType class >> sizeOfInt256 [
	^ self sizeOfUint256 
]

{ #category : #'as yet unclassified' }
FogSimpleType class >> sizeOfString [
	^ self sizeOfUint256 
]

{ #category : #'as yet unclassified' }
FogSimpleType class >> sizeOfUint [
	^ self sizeOfUint256
]

{ #category : #'as yet unclassified' }
FogSimpleType class >> sizeOfUint256 [
	^ 32
]

{ #category : #'as yet unclassified' }
FogSimpleType class >> sizeOfUint32 [
	^ 4
]

{ #category : #'as yet unclassified' }
FogSimpleType class >> sizeOfUint64 [
	^ 8
]

{ #category : #'as yet unclassified' }
FogSimpleType class >> sizeOfUint8 [
	^ 1
]

{ #category : #accessing }
FogSimpleType >> name [
	^ name
]

{ #category : #accessing }
FogSimpleType >> name: aString [
	name := aString
]

{ #category : #marshaling }
FogSimpleType >> pack: aString using: anETHPacker [
	^ anETHPacker pack: {aString} with: {name}
]

{ #category : #printing }
FogSimpleType >> printOn: aStream [
	aStream nextPutAll: name
]

{ #category : #marshaling }
FogSimpleType >> staticSlotSize [
	^ self class perform: ('sizeOf' , name capitalized) asSymbol
]

{ #category : #marshaling }
FogSimpleType >> unpack: aString using: anETHPacker [
	^ (anETHPacker unpack: aString with: {name}) at: 1
]

{ #category : #marshaling }
FogSimpleType >> unpackStream: aReadStream using: aFogPacker [  
	^ self unpack: (aReadStream next: self staticSlotSize *2  ) using: aFogPacker 
]
