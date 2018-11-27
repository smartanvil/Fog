"
Binary packer encodes and decodes from and to binary representation
"
Class {
	#name : #FogBinaryPacker,
	#superclass : #Object,
	#traits : 'TFogPack',
	#classTraits : 'TFogPack classTrait',
	#category : 'FogDB-Util'
}

{ #category : #packing }
FogBinaryPacker class >> packSlotId: anInteger [
	^ self new packSlotId: anInteger
]

{ #category : #'as yet unclassified' }
FogBinaryPacker class >> packUint128: anInteger [ 
	^ self new packUint128: anInteger 
]

{ #category : #'as yet unclassified' }
FogBinaryPacker class >> packUint256: anInteger [ 
	^ self new packUint256: anInteger 
]

{ #category : #required }
FogBinaryPacker >> dumpInt: anInteger size: aSize [
	^ ((1 to: aSize) reverse collect: [ :i | anInteger digitAt: i ]) asByteArray
]

{ #category : #required }
FogBinaryPacker >> pack: aCollection with: aCollectionOfTypeNames [
	| pack |
	pack := OrderedCollection new.
	self assert: aCollection size = aCollectionOfTypeNames size.
	^ ((1 to: aCollection size)
		flatCollect:  [ :id | 
			| data typePacker |
			data := aCollection at: id.
			typePacker := ('pack' , (aCollectionOfTypeNames at: id) capitalized , ':') asSymbol.
			self perform: typePacker withArguments: {data} ]) asByteArray
]
