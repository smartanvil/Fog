"
This lazy dictionary loads information from mapping fetching one key at the time. 
"
Class {
	#name : #FogLazyDictionary,
	#superclass : #FogSessionObject,
	#instVars : [
		'mapping',
		'type',
		'dictionary',
		'bind',
		'blockReference',
		'contractAddress'
	],
	#category : 'FogLive-Domain'
}

{ #category : #accessing }
FogLazyDictionary class >> neoJsonMapping: mapper [
	mapper
		for: self
		do: [ :mapping | 
			mapping
				mapAccessor: #keyMapping ;
				mapAccessor: #valueMapping ]
]

{ #category : #accessing }
FogLazyDictionary >> at: aKey [
	^ dictionary
		at: aKey
		ifAbsentPut: [ self session decodeStream: (self session fetchSlot: (self storageHashFor: aKey) asHeadlessHexa onContract: contractAddress at: blockReference) readStream type: type valueType ]
]

{ #category : #accessing }
FogLazyDictionary >> blockReference: aString [ 
	blockReference := aString
]

{ #category : #accessing }
FogLazyDictionary >> contractAddress: aContractAddress [
	contractAddress := aContractAddress
]

{ #category : #accessing }
FogLazyDictionary >> dictionary [
	^ dictionary 
]

{ #category : #initialization }
FogLazyDictionary >> initialize [
	super initialize.
	dictionary := Dictionary new. 
]

{ #category : #accessing }
FogLazyDictionary >> keyMapping [
	^ type keyType asString
]

{ #category : #accessing }
FogLazyDictionary >> mapping [
	^ mapping 
]

{ #category : #'as yet unclassified' }
FogLazyDictionary >> mapping: aFogSolidityMappingLayoutMapping [ 
	mapping := aFogSolidityMappingLayoutMapping
]

{ #category : #'as yet unclassified' }
FogLazyDictionary >> storageHashFor: aKey [
	| packer |
	packer := FogBinaryPacker new.
	^ Keccak hashEncode: (type keyType pack: aKey using: packer) , (packer packSlotId: mapping fromSlot)
]

{ #category : #'as yet unclassified' }
FogLazyDictionary >> type [
	^ type
]

{ #category : #'as yet unclassified' }
FogLazyDictionary >> type: aFogMappingType [ 
	type := aFogMappingType
]

{ #category : #'as yet unclassified' }
FogLazyDictionary >> valueMapping [
	^ type valueType asString
]
