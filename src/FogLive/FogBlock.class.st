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

{ #category : #comparing }
FogBlock >> = anObject [
	self species = anObject species
		ifFalse: [ ^ false ].
	^ self valuesToCompareForEquality = anObject valuesToCompareForEquality
]

{ #category : #accessing }
FogBlock >> accounts [
	<doc: 'Returns a collection with all accounts related with this block'>
	^ ((self transactions collect: #from) , (self transactions collect: #to) , {FogNoAccount nilAccount}) asSet
]

{ #category : #accessing }
FogBlock >> amountOfTransactions [ 
	<doc: 'Returns the amount of transactions stored in this block'>
	^ transactionsHashes size
]

{ #category : #private }
FogBlock >> blockHash [
	<doc: 'Returns Block''s hash'>
	^ blockHash
]

{ #category : #accessing }
FogBlock >> difficulty [
	<doc: 'Returns the block''s dificulty'>
	^ difficulty
]

{ #category : #accessing }
FogBlock >> difficulty: anObject [ 
	difficulty := anObject read0xHexadecimal
]

{ #category : #accessing }
FogBlock >> extraData [ 
	<doc: 'Returns the block''s extraData field'>
	^ extraData
]

{ #category : #accessing }
FogBlock >> extraData: anObject [ 
	extraData := anObject
]

{ #category : #private }
FogBlock >> forceLoad [
	<doc: 'Forces the creation of each of the related objects: transactions, parent block, uncle blocks'>
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
	<doc: 'Returns the limit of gas applyed to this block'>
	^ gasLimit
]

{ #category : #accessing }
FogBlock >> gasLimit: anObject [
	gasLimit := anObject read0xHexadecimal
]

{ #category : #accessing }
FogBlock >> gasUsed [
	<doc: 'Returns the gas used in this block'>
	^ gasUsed read0xHexadecimal
]

{ #category : #accessing }
FogBlock >> gasUsed: anObject [
	gasUsed := anObject read0xHexadecimal
]

{ #category : #comparing }
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
	<doc: 'Returns the block''s logs bloom field'>
	^ logsBloom
]

{ #category : #accessing }
FogBlock >> logsBloom: anObject [ 
	logsBloom := anObject
]

{ #category : #accessing }
FogBlock >> miner [
	<doc: 'Returns the miner hash'>
	^ miner
]

{ #category : #accessing }
FogBlock >> miner: anObject [ 
	miner := anObject
]

{ #category : #accessing }
FogBlock >> mixHash [
	<doc: 'Returns the block''s mixHash field'>
	^ mixHash
]

{ #category : #accessing }
FogBlock >> mixHash: anObject [ 
	mixHash := anObject
]

{ #category : #accessing }
FogBlock >> next [
	<doc: 'Returns the block holding the next block number'>
	^ self session findBlockByNumber: self number + 1 full: true.

]

{ #category : #accessing }
FogBlock >> nonce [
	<doc: 'Returns the block''s nounce'>
	^ nonce
]

{ #category : #accessing }
FogBlock >> nonce: anObject [ 
	nonce := anObject
]

{ #category : #properties }
FogBlock >> number [
	<doc: 'Returns the block''s number'>
	^ number
]

{ #category : #accessing }
FogBlock >> number: anObject [ 
	number := anObject read0xHexadecimal
]

{ #category : #accessing }
FogBlock >> parent [
	<doc: 'Returns the block''s parent block object'>
	^ parent ifNil: [ parent := [self session findBlockByHash: self parentHash full: true ] on: Error do: [ parent := nil ]]
]

{ #category : #accessing }
FogBlock >> parentHash [
	<doc: 'Returns the block''s parent hash'>
	^ parentHash
]

{ #category : #accessing }
FogBlock >> parentHash: anObject [ 
	parentHash := anObject
]

{ #category : #accessing }
FogBlock >> previous [
	<doc: 'Returns the block holding the previous block number'>
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
	<doc: 'Returns the block''s hash. This name is renamed to avoid problems with the object''s hash definition'>
	^ blockHash
]

{ #category : #private }
FogBlock >> privateInflateTransactions [
	
	^ transactionsHashes
		collect: [ :t | self session findTransactionByDescription: t ]
]

{ #category : #'as yet unclassified' }
FogBlock >> receiptRoot: aString [
	<doc: 'Returns block''s receiptRoot field'>
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
	<doc: 'Returns the addresses of the block''s uncles'>
	^ sha3Uncles
]

{ #category : #accessing }
FogBlock >> sha3Uncles: anObject [ 
	sha3Uncles := anObject
]

{ #category : #properties }
FogBlock >> size [
	<doc: 'Returns the size of the block'>
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
	<doc: 'Returns block''s stateRoot field'>
	^ stateRoot
]

{ #category : #accessing }
FogBlock >> stateRoot: anObject [ 
	stateRoot := anObject 
]

{ #category : #accessing }
FogBlock >> timestamp [
	<doc: 'Returns the block''s timestamp field'>
	^ timestamp
]

{ #category : #accessing }
FogBlock >> timestamp: anObject [ 
	timestamp := DateAndTime fromUnixTime: (anObject read0xHexadecimal)
	
]

{ #category : #accessing }
FogBlock >> totalDifficulty [
	<doc: 'Returns the block''s totalDifficulty field'>
	^ totalDifficulty read0xHexadecimal
]

{ #category : #accessing }
FogBlock >> totalDifficulty: anObject [ 
	totalDifficulty := anObject 
]

{ #category : #accessing }
FogBlock >> transactions [
	<doc: 'Returns a collection with all the transaction objects belonging to this block'>
	^ transactions ifNil: [ transactions := self privateInflateTransactions ]
]

{ #category : #accessing }
FogBlock >> transactions: anObject [ 
	transactionsHashes := anObject
]

{ #category : #private }
FogBlock >> transactionsHashes [
	<doc: 'Returns a collection with all the transaction hashes  belonging to this block'>
	^ transactionsHashes
]

{ #category : #accessing }
FogBlock >> transactionsRoot [
	<doc: 'Returns the block''s transactionRoot field'>
	^ transactionsRoot
]

{ #category : #accessing }
FogBlock >> transactionsRoot: anObject [ 
	transactionsRoot := anObject 
]

{ #category : #accessing }
FogBlock >> uncles [
	<doc: 'Returns a collection with all uncle blocks of this block. '>
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
