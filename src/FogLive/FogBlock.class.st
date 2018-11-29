"
Block. This is a full representation of a Ethereum block. It has some lazy initialization methods, as, parent, transactions, uncles. 
"
Class {
	#name : #FogBlock,
	#superclass : #FogSessionObject,
	#traits : 'TEquality',
	#classTraits : 'TEquality classTrait',
	#instVars : [
		'full',
		'transactions',
		'difficulty',
		'extraData',
		'gasLimit',
		'gasUsed',
		'logsBloom',
		'miner',
		'mixHash',
		'nonce',
		'number',
		'size',
		'parentHash',
		'receiptsRoot',
		'sha3Uncles',
		'stateRoot',
		'totalDifficulty',
		'transactionsRoot',
		'uncles',
		'timestamp',
		'blockHash',
		'transactionsHashes',
		'parent',
		'unclesHashes',
		'relatedContracts',
		'relatedStorage',
		'receiptRoot'
	],
	#category : 'FogLive-Domain'
}

{ #category : #'as yet unclassified' }
FogBlock class >> collectionSelector [
	^ #blocks
]

{ #category : #equality }
FogBlock >> = anObject [
	self species = anObject species
		ifFalse: [ ^ false ].
	^ self valuesToCompareForEquality = anObject valuesToCompareForEquality
]

{ #category : #accessing }
FogBlock >> accounts [
	^ ((self transactions collect: #from) , (self transactions collect: #to) , {FogNoAccount nilAccount}) asSet
]

{ #category : #accessing }
FogBlock >> amountOfTransactions [ 
	^ transactionsHashes size
]

{ #category : #private }
FogBlock >> blockHash [
	^ blockHash
]

{ #category : #accessing }
FogBlock >> difficulty [ 
	^ difficulty
]

{ #category : #accessing }
FogBlock >> difficulty: anObject [ 
	difficulty := anObject asBKNumber
]

{ #category : #accessing }
FogBlock >> extraData [ 
	^ extraData
]

{ #category : #accessing }
FogBlock >> extraData: anObject [ 
	extraData := anObject
]

{ #category : #private }
FogBlock >> forceLoad [
	self transactions.
	self parent. 
	self uncles.
	
]

{ #category : #accessing }
FogBlock >> full [
	^ full
		ifFalse: [ self session findBlockByHash: self privateBlockHash full: true ]
		ifTrue: [ self ]
]

{ #category : #accessing }
FogBlock >> full: aBoolean [
	full := aBoolean
]

{ #category : #accessing }
FogBlock >> gasLimit [ 
	^ gasLimit
]

{ #category : #accessing }
FogBlock >> gasLimit: anObject [
	gasLimit := anObject asBKNumber
]

{ #category : #accessing }
FogBlock >> gasUsed [
	^ gasUsed asBKNumber
]

{ #category : #accessing }
FogBlock >> gasUsed: anObject [
	gasUsed := anObject asBKNumber
]

{ #category : #equality }
FogBlock >> hash [
	^self valuesToCompareForEquality inject: self species hash into: [:hash :comparisonValue|
		(hash bitXor: comparisonValue hash) hashMultiply]

]

{ #category : #accessing }
FogBlock >> hash: aString [ 
	blockHash := aString
]

{ #category : #testing }
FogBlock >> isFull [
	^ full ifNil: [ false ]
]

{ #category : #testing }
FogBlock >> isTheSameBlockAs: aETHBlock [
	^ self privateBlockHash = aETHBlock privateBlockHash
]

{ #category : #accessing }
FogBlock >> logsBloom [ 
	^ logsBloom
	
]

{ #category : #accessing }
FogBlock >> logsBloom: anObject [ 
	logsBloom := anObject
]

{ #category : #accessing }
FogBlock >> miner [ 
	^ miner
	
]

{ #category : #accessing }
FogBlock >> miner: anObject [ 
	miner := anObject
]

{ #category : #accessing }
FogBlock >> mixHash [ 
	^ mixHash
	
]

{ #category : #accessing }
FogBlock >> mixHash: anObject [ 
	mixHash := anObject
]

{ #category : #accessing }
FogBlock >> next [
	^ self session findBlockByNumber: self number + 1 full: true.

]

{ #category : #accessing }
FogBlock >> nonce [ 
	^ nonce
	
]

{ #category : #accessing }
FogBlock >> nonce: anObject [ 
	nonce := anObject
]

{ #category : #properties }
FogBlock >> number [ 
	^ number
	
]

{ #category : #accessing }
FogBlock >> number: anObject [ 
	number := anObject asBKNumber
]

{ #category : #accessing }
FogBlock >> parent [
	^ parent ifNil: [ parent := [self session findBlockByHash: self parentHash full: true ] on: Error do: [ parent := nil ]]
]

{ #category : #accessing }
FogBlock >> parentHash [ 
	^ parentHash 
]

{ #category : #accessing }
FogBlock >> parentHash: anObject [ 
	parentHash := anObject
]

{ #category : #accessing }
FogBlock >> previous [
"self haltIf: [ ('2016-05-23T19:51:02+02:00' asDateAndTime - self timestamp) abs < 10 days ]."
	^ self session findBlockByNumber: self number - 1 full: true
]

{ #category : #printing }
FogBlock >> printOn: aStream [
	^ ('Block- {1} - {2} transaction(s) '
		format:
			{self number asString.
			transactionsHashes size asString}) printOn: aStream
]

{ #category : #private }
FogBlock >> privateAddress [
	^ blockHash
]

{ #category : #private }
FogBlock >> privateBlockHash [
	^ blockHash
]

{ #category : #private }
FogBlock >> privateInflateTransactions [
	^ transactionsHashes
		collect: [ :t | self session findTransactionByDescription: t ]
]

{ #category : #'as yet unclassified' }
FogBlock >> receiptRoot: aString [
	receiptRoot := aString
]

{ #category : #accessing }
FogBlock >> receiptsRoot [ 
	^ receiptsRoot 
]

{ #category : #accessing }
FogBlock >> receiptsRoot: anObject [ 
	receiptsRoot := anObject
]

{ #category : #accessing }
FogBlock >> sha3Uncles [ 
	^ sha3Uncles 
]

{ #category : #accessing }
FogBlock >> sha3Uncles: anObject [ 
	sha3Uncles := anObject
]

{ #category : #properties }
FogBlock >> size [ 
	^ size
]

{ #category : #accessing }
FogBlock >> size: anObject [ 
	size := anObject
	
]

{ #category : #accessing }
FogBlock >> source: aCollection [
	aCollection keysAndValuesDo: [ :k :v | self perform: (k , ':') asSymbol withArguments: {v} ]
]

{ #category : #accessing }
FogBlock >> stateRoot [ 
	^ stateRoot
]

{ #category : #accessing }
FogBlock >> stateRoot: anObject [ 
	stateRoot := anObject 
]

{ #category : #accessing }
FogBlock >> timestamp [ 
	^ timestamp
]

{ #category : #accessing }
FogBlock >> timestamp: anObject [ 
	timestamp := DateAndTime fromUnixTime: (anObject asBKNumber)
	
]

{ #category : #accessing }
FogBlock >> totalDifficulty [ 
	^ totalDifficulty asBKNumber
]

{ #category : #accessing }
FogBlock >> totalDifficulty: anObject [ 
	totalDifficulty := anObject 
]

{ #category : #accessing }
FogBlock >> transactions [
	^ transactions ifNil: [ transactions := self privateInflateTransactions ]
]

{ #category : #accessing }
FogBlock >> transactions: anObject [ 
	transactionsHashes := anObject
]

{ #category : #private }
FogBlock >> transactionsHashes [
	^ transactionsHashes
]

{ #category : #accessing }
FogBlock >> transactionsRoot [ 
	^ transactionsRoot
]

{ #category : #accessing }
FogBlock >> transactionsRoot: anObject [ 
	transactionsRoot := anObject 
]

{ #category : #accessing }
FogBlock >> uncles [
	^ uncles ifNil: [ uncles := unclesHashes collect: [ :u | self session findBlockByHash: u full: true ] ]
]

{ #category : #accessing }
FogBlock >> uncles: anObject [ 
	unclesHashes := anObject
]

{ #category : #equality }
FogBlock >> valuesToCompareForEquality [
	^ { blockHash . full }
]
