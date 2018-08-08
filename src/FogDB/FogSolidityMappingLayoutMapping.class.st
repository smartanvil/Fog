"
Maps the special case of the mapping. 
"
Class {
	#name : #FogSolidityMappingLayoutMapping,
	#superclass : #FogSolidityLayoutMapping,
	#instVars : [
		'keyMapping',
		'valueMapping'
	],
	#category : 'FogDB-Meta-SolidityLayout'
}

{ #category : #accessing }
FogSolidityMappingLayoutMapping >> keyMapping [
	^ keyMapping
]

{ #category : #initialization }
FogSolidityMappingLayoutMapping >> using: aSession fetchContentsFrom: aContractAddress at: aBlockTagNumberOrHash [
	^ FogLazyDictionary new
		mapping: self;
		session: aSession;
		blockReference: aBlockTagNumberOrHash;
		contractAddress: aContractAddress;
		yourself
]

{ #category : #accessing }
FogSolidityMappingLayoutMapping >> valueMapping [
	^ valueMapping
]
