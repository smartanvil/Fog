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
	self subclassResponsibility 
]

{ #category : #marshaling }
FogType >> unpackReturn: aString using: aFogPacker [
	^ self unpack: aString using: aFogPacker

]
