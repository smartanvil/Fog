"
Definition of a concrete field 
"
Class {
	#name : #FogContractInstanceSlot,
	#superclass : #Object,
	#instVars : [
		'slot',
		'contractInstance'
	],
	#category : 'FogDB-Domain'
}

{ #category : #'as yet unclassified' }
FogContractInstanceSlot >> contractInstance: anETHContractInstance [ 
	contractInstance := anETHContractInstance
]

{ #category : #'as yet unclassified' }
FogContractInstanceSlot >> name [
	^ slot name
]

{ #category : #'as yet unclassified' }
FogContractInstanceSlot >> slot: anETHContractSlot [ 
	slot := anETHContractSlot
]

{ #category : #'as yet unclassified' }
FogContractInstanceSlot >> type [
	^ slot type
]

{ #category : #'as yet unclassified' }
FogContractInstanceSlot >> value [
	^ slot value: contractInstance
]
