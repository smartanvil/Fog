"
This is a filter definition transfert entity.It has the need information to installa filter.
"
Class {
	#name : #FogFilterDefinition,
	#superclass : #Object,
	#instVars : [
		'topics',
		'address',
		'from',
		'to'
	],
	#category : 'FogCommunication-Transfer-Filters'
}

{ #category : #'as yet unclassified' }
FogFilterDefinition class >> neoJsonMapping: mapper [
	mapper
		for: self
		do: [ :mapping | 
			mapping
				mapAccessor: #fromBlock;
				mapAccessor: #toBlock;
				mapAccessor: #address to: #address;
				mapAccessor: #generateTopicsForTransfer to: #topics ]
]

{ #category : #'as yet unclassified' }
FogFilterDefinition >> address [
	^ address
]

{ #category : #accessing }
FogFilterDefinition >> address: anAddress [
	address := anAddress
]

{ #category : #'as yet unclassified' }
FogFilterDefinition >> from [
	^ from
]

{ #category : #accessing }
FogFilterDefinition >> from: anInteger [
	from := anInteger
]

{ #category : #'as yet unclassified' }
FogFilterDefinition >> fromBlock [
	^ from ifNil: [ nil ] ifNotNil: [ from asBKHexa ]
]

{ #category : #'as yet unclassified' }
FogFilterDefinition >> generateTopicsForTransfer [
	^ topics forTransfer
]

{ #category : #'as yet unclassified' }
FogFilterDefinition >> to [
	^to 
]

{ #category : #'as yet unclassified' }
FogFilterDefinition >> to: aBlockNumber [
	to := aBlockNumber
]

{ #category : #'as yet unclassified' }
FogFilterDefinition >> toBlock [
	^ to ifNil: [ nil ] ifNotNil: [ to asBKHexa ]
]

{ #category : #'as yet unclassified' }
FogFilterDefinition >> topics: aETHFilterTopic [
	topics := aETHFilterTopic 
]
