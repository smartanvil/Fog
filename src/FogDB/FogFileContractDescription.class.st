"
Contract loaded from disk 
"
Class {
	#name : #FogFileContractDescription,
	#superclass : #FogContractDescription,
	#instVars : [
		'fromFile'
	],
	#category : 'FogDB-Meta-Description'
}

{ #category : #'as yet unclassified' }
FogFileContractDescription class >> loadCode: aFileReference session: aSession [
	| compiled ref |
	ref := aFileReference exists
		ifFalse: [ aFileReference parent / (((('.' split: aFileReference basename) at: 1) copyFrom: 1 to: (('.' split: aFileReference basename) at: 1) size - 1) , '.sol') ]
		ifTrue: [ aFileReference ].
	compiled := aSession compileSolidity: ref.
	compiled fromFile: ref.
	^ compiled
]

{ #category : #'as yet unclassified' }
FogFileContractDescription class >> loadKnownContracts: aDirectory session: aSession [
	aDirectory entries
		select: [ :b | b basename endsWith: '.sol' ]
		thenCollect: [ :f | aSession findContractDescriptionForFileReference: f ]
]

{ #category : #accessing }
FogFileContractDescription >> fromFile [
	^ fromFile
]

{ #category : #accessing }
FogFileContractDescription >> fromFile: aFileReference [
	fromFile := aFileReference
]

{ #category : #accessing }
FogFileContractDescription >> isFileBased [
	^ true
]

{ #category : #accessing }
FogFileContractDescription >> name [
	^ fromFile basename copyFrom: 1 to: (fromFile basename indexOf: $.) - 1
]

{ #category : #printing }
FogFileContractDescription >> printOn: aStream [
	^ ('Fileloaded contract {1} ' format: {fromFile asFileReference basename})
		printOn: aStream
]

{ #category : #'as yet unclassified' }
FogFileContractDescription >> similarityThreshold [
	^ 0.1
]

{ #category : #accessing }
FogFileContractDescription >> source [
	^ fromFile readStream upToEnd. 
]
