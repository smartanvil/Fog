"
Message represents a message send from this image to the RPC server 
"
Class {
	#name : #FogMessage,
	#superclass : #Object,
	#traits : 'TEquality',
	#classTraits : 'TEquality classTrait',
	#instVars : [
		'method',
		'parameters'
	],
	#category : 'FogComm-Transfer'
}

{ #category : #comparing }
FogMessage >> = anObject [
	self species = anObject species
		ifFalse: [ ^ false ].
	^ self valuesToCompareForEquality = anObject valuesToCompareForEquality
]

{ #category : #comparing }
FogMessage >> hash [
	^self valuesToCompareForEquality inject: self species hash into: [:hash :comparisonValue|
		(hash bitXor: comparisonValue hash) hashMultiply]

]

{ #category : #'as yet unclassified' }
FogMessage >> initialize [
	parameters := Array new
]

{ #category : #accessor }
FogMessage >> method [
	^ method
]

{ #category : #accessor }
FogMessage >> method: aString [
	method := aString
]

{ #category : #accessing }
FogMessage >> module [
	^ ('_' split: method) first asSymbol
]

{ #category : #'as yet unclassified' }
FogMessage >> parameters [
	^ parameters
]

{ #category : #'as yet unclassified' }
FogMessage >> parameters: aCollection [
	parameters := aCollection
]

{ #category : #'as yet unclassified' }
FogMessage >> printOn: aStream [
	^('RPC message:{1} parameters:{2}'
		format:
			{method.
			parameters asString}) printOn: aStream
]

{ #category : #accessing }
FogMessage >> serviceSelector [
	^( ('_' split: method) second, ':') asSymbol
]
