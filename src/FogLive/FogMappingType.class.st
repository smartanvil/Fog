"
Mapping type marshal/unmarshal 
"
Class {
	#name : #FogMappingType,
	#superclass : #FogType,
	#instVars : [
		'keyType',
		'valueType'
	],
	#category : 'FogLive-Meta-Types'
}

{ #category : #accessing }
FogMappingType >> keyType [
	^ keyType
]

{ #category : #accessing }
FogMappingType >> keyType: anETHSimpleType [ 
	keyType := anETHSimpleType
]

{ #category : #testing }
FogMappingType >> mapping [
	^ FogSolidityMappingLayoutMapping 
]

{ #category : #accessing }
FogMappingType >> name [
	^ keyType name , '=>' , valueType name
]

{ #category : #testing }
FogMappingType >> staticSlotSize [
	^ 32
]

{ #category : #testing }
FogMappingType >> unpack: aLazyDictionary using: anETHPacker [
	aLazyDictionary type: self.
	^ aLazyDictionary 
]

{ #category : #accessing }
FogMappingType >> valueType [
	^ valueType
]

{ #category : #accessing }
FogMappingType >> valueType: anETHStructType [ 
	valueType := anETHStructType
]
