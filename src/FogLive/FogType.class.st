"
Abstract type, it just declares some abstract methods 
"
Class {
	#name : #FogType,
	#superclass : #Object,
	#category : 'FogLive-Meta-Types'
}

{ #category : #collecting }
FogType >> collect: aBlockClosure [
	^ {(aBlockClosure value: self)}
]

{ #category : #testing }
FogType >> isArrayType [
	^ false 
]

{ #category : #'as yet unclassified' }
FogType >> isEmptyType [
	^ false
]

{ #category : #testing }
FogType >> isStruct [
	^ false. 
]

{ #category : #accessing }
FogType >> mapping [
	^ FogSolidityLayoutMapping
]

{ #category : #marshaling }
FogType >> pack: aString using: aFogPacker [
	<doc: 'Subclass responsibilty. It packs (or marshal ) a content according to the type, using a packing object '>
	self subclassResponsibility
]

{ #category : #accessing }
FogType >> signatureName [
	^ self name
]

{ #category : #marshaling }
FogType >> staticSlotSize [
	^ self subclassResponsibility
]

{ #category : #marshaling }
FogType >> unpack: aString using: aFogPacker [
	<doc: 'Subclass responsibilty. It unpacks (or unmarshal ) a content according to the type, using a packing object '>
	self subclassResponsibility
]

{ #category : #marshaling }
FogType >> unpackReturn: aString using: aFogPacker [
	^ self unpack: aString using: aFogPacker

]
