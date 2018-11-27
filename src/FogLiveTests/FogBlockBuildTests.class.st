"
This test needs a running GETH installation alongside. 
"
Class {
	#name : #FogBlockBuildTests,
	#superclass : #FogTestCase,
	#instVars : [
		'eth'
	],
	#category : 'FogLiveTests'
}

{ #category : #'as yet unclassified' }
FogBlockBuildTests >> deny: got equals: expected [
	self deny: got = expected
]

{ #category : #'as yet unclassified' }
FogBlockBuildTests >> testBlockEquality [
	self assert: (session findBlockByTag: 'latest' full: true) equals: (session findBlockByTag: 'latest' full: true)
]

{ #category : #'as yet unclassified' }
FogBlockBuildTests >> testBlockTestIsSame [
	| latestFull latestPartial |
	latestFull := session findBlockByTag: 'latest' full: true.
	latestPartial := session findBlockByTag: 'latest' full: false.
	self assert: (latestFull isTheSameBlockAs: latestPartial).
	self assert: latestFull equals: latestPartial full
]

{ #category : #'as yet unclassified' }
FogBlockBuildTests >> testGetBlockGivesABlock [
	self assert: ((session findBlockByTag: 'latest' full: true) isKindOf: FogBlock)
]

{ #category : #'as yet unclassified' }
FogBlockBuildTests >> testGetBlockParentFetchBlock [
	self assert: ((session findBlockByTag: 'latest' full: true) parent isKindOf: FogBlock)
]

{ #category : #'as yet unclassified' }
FogBlockBuildTests >> testGetBlockTransactionsFetchCollection [
	self assert: (session findBlockByTag: 'latest' full: true) parent transactions size isNumber
]
