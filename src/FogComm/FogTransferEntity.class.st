"
This object is the regular transfer entity. It has an id of request, message name and parameters 
"
Class {
	#name : #FogTransferEntity,
	#superclass : #Object,
	#traits : 'TEquality',
	#classTraits : 'TEquality classTrait',
	#instVars : [
		'id',
		'jsonrpc',
		'message'
	],
	#category : 'FogComm-Transfer'
}

{ #category : #'as yet unclassified' }
FogTransferEntity class >> neoJsonMapping: mapper [
	mapper
		for: self
		do: [ :mapping | 
			mapping
				mapAccessor: #jsonrpc;
				mapAccessor: #id;
				mapAccessor: #method;
				mapAccessor: #parameters to: #params ]
]

{ #category : #equality }
FogTransferEntity >> = anObject [
	self species = anObject species
		ifFalse: [ ^ false ].
	^ self valuesToCompareForEquality = anObject valuesToCompareForEquality
]

{ #category : #equality }
FogTransferEntity >> hash [
	^self valuesToCompareForEquality inject: self species hash into: [:hash :comparisonValue|
		(hash bitXor: comparisonValue hash) hashMultiply]

]

{ #category : #accessor }
FogTransferEntity >> id [
	^ id
]

{ #category : #accessor }
FogTransferEntity >> id: anInteger [ 
	id := anInteger
]

{ #category : #accessor }
FogTransferEntity >> jsonrpc [
	^ jsonrpc
]

{ #category : #accessor }
FogTransferEntity >> jsonrpc: aString [ 
	jsonrpc := aString
]

{ #category : #'as yet unclassified' }
FogTransferEntity >> message [
	^ message
]

{ #category : #'as yet unclassified' }
FogTransferEntity >> message: aETHMessage [
	message := aETHMessage
]

{ #category : #'as yet unclassified' }
FogTransferEntity >> method [
	^ message method
]

{ #category : #'as yet unclassified' }
FogTransferEntity >> parameters [
	^ message parameters
]

{ #category : #'as yet unclassified' }
FogTransferEntity >> printOn: aStream [
	('TransferEntity id: {1} version: {2} '
		format:
			{id.
			jsonrpc}) printOn: aStream.
	aStream cr.
	^ message printOn: aStream
]
