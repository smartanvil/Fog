"
Maps the special case of the struct. 
"
Class {
	#name : #FogSolidityStructLayoutMapping,
	#superclass : #FogSolidityLayoutMapping,
	#instVars : [
		'mappings'
	],
	#category : 'FogDB-Meta-SolidityLayout'
}

{ #category : #initialization }
FogSolidityStructLayoutMapping >> addAll: aSetOfMappings [
	mappings addAll: aSetOfMappings
]

{ #category : #initialization }
FogSolidityStructLayoutMapping >> initialize [
	super initialize.
	mappings := OrderedCollection new.
	
]

{ #category : #initialization }
FogSolidityStructLayoutMapping >> using: aSession fetchContentsFrom: aContractAddress at: aBlockTagNumberOrHash [
	^ mappings collect: [ :m | m using: aSession fetchContentsFrom: aContractAddress at: aBlockTagNumberOrHash]
]
