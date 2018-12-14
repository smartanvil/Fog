"
This is a ethereum applyied transaction representation that has some lazy initializatyion methods as block .
"
Class {
	#name : #FogTransaction,
	#superclass : #FogSessionObject,
	#traits : 'TEquality',
	#classTraits : 'TEquality classTrait',
	#instVars : [
		'source',
		's',
		'blockNumber',
		'r',
		'nonce',
		'blockHash',
		'value',
		'gasPrice',
		'from',
		'hash',
		'gas',
		'input',
		'to',
		'transactionIndex',
		'v',
		'block',
		'toAddress',
		'fromAddress'
	],
	#category : #'FogLive-Domain'
}

{ #category : #'as yet unclassified' }
FogTransaction class >> collectionSelector [
	^ #transactions
]

{ #category : #'as yet unclassified' }
FogTransaction class >> on: aCollection [
	^ self new
		source: aCollection;
		yourself
]

{ #category : #comparing }
FogTransaction >> = anObject [
	self species = anObject species
		ifFalse: [ ^ false ].
	^ self valuesToCompareForEquality = anObject valuesToCompareForEquality
]

{ #category : #accessing }
FogTransaction >> accounts [
	<doc:
		'It returns the account objects related to the transaction'>
	^ {self to.
	self from}
]

{ #category : #accessing }
FogTransaction >> amount [
	<doc: 'Return the amount trasnferred by this transaction in Wei'>
	^ value
]

{ #category : #accessing }
FogTransaction >> block [
	<doc: 'Returns the block to which whom belongs this transaction '>
	^ block ifNil: [ block := self session findBlockByHash: blockHash full: true ]
]

{ #category : #accessing }
FogTransaction >> blockHash: aString [
	blockHash := aString
]

{ #category : #accessing }
FogTransaction >> blockNumber [
	<doc:
		'Returns the number of the block to whom belongs this transaction'>
	^ blockNumber
]

{ #category : #accessing }
FogTransaction >> blockNumber: aString [
	blockNumber := aString read0xHexadecimal
]

{ #category : #accessing }
FogTransaction >> from [
	<doc:
		'Returns the from account'>
	^ from ifNil: [ self session findAccountByHash: fromAddress blockNumber: blockNumber ]
]

{ #category : #accessing }
FogTransaction >> from: aValue [
	aValue isString
		ifTrue: [ fromAddress := aValue ]
		ifFalse: [ from := aValue ]
]

{ #category : #accessing }
FogTransaction >> fromAddress [
	<doc:
		'Returns the hash address of the #from account'>
	^ fromAddress
]

{ #category : #accessing }
FogTransaction >> gas [
	<doc:
		'Returns the amount of gas used by this transaction'>
	^ gas
]

{ #category : #accessing }
FogTransaction >> gas: aString [
	gas := aString read0xHexadecimal
]

{ #category : #accessing }
FogTransaction >> gasPrice [
	<doc: 'Returns price payed per gas unit by this transaction'>
	^ gasPrice
]

{ #category : #accessing }
FogTransaction >> gasPrice: aString [
	gasPrice := aString read0xHexadecimal
]

{ #category : #comparing }
FogTransaction >> hash [
	^self valuesToCompareForEquality inject: self species hash into: [:hash :comparisonValue|
		(hash bitXor: comparisonValue hash) hashMultiply]

]

{ #category : #accessing }
FogTransaction >> hash: aString [
	hash := aString
]

{ #category : #accessing }
FogTransaction >> input: aString [
	input := aString 
]

{ #category : #accessing }
FogTransaction >> nonce: aString [ 
	nonce := aString read0xHexadecimal 
]

{ #category : #printing }
FogTransaction >> printOn: aStream [
	^ ('{1} -> {2} ${3}'
		format:
			{(fromAddress ifNotNil: [ fromAddress ] ifNil: [ '[From:Null]' ]).
			(toAddress ifNotNil: [ toAddress ] ifNil: [ '[To:Null]' ]).
			value asString}) printOn: aStream
]

{ #category : #private }
FogTransaction >> privateAddress [
	^ hash 
]

{ #category : #private }
FogTransaction >> privateTransactionHash [
	^ hash 
]

{ #category : #accessing }
FogTransaction >> r: aString [
	r := aString
]

{ #category : #accessing }
FogTransaction >> s: aString [
	s := aString
]

{ #category : #accessing }
FogTransaction >> source: aCollection [
	source := aCollection.
	source keysAndValuesDo: [ :k :val | self perform: (k , ':') asSymbol withArguments: {val} ]
]

{ #category : #'as yet unclassified' }
FogTransaction >> timestamp [
	<doc:
		'Returns the timestamp when this transaction was accepted. (It refers to the block''s timestamp and not to the transaction issued timestamp)'>
	^ self block timestamp
]

{ #category : #accessing }
FogTransaction >> to [
	<doc:
		'Returns the hash address of the #to account'>
	^ to ifNil: [ to := self session findAccountByHash: toAddress blockNumber: blockNumber ]
]

{ #category : #accessing }
FogTransaction >> to: aValue [
	aValue isString
		ifTrue: [ toAddress := aValue ]
		ifFalse: [ to := aValue ]
]

{ #category : #accessing }
FogTransaction >> toAddress [
<doc:
		'Returns the hash address of the #to account'>
	^ toAddress
]

{ #category : #accessing }
FogTransaction >> transactionIndex [
	<doc: 'Returns the number of transaction (ordinal) in the holding block'>
	^ transactionIndex
]

{ #category : #accessing }
FogTransaction >> transactionIndex: aString [
	transactionIndex := aString read0xHexadecimal
]

{ #category : #accessing }
FogTransaction >> v: aString [
	v := aString
]

{ #category : #accessing }
FogTransaction >> value: aString [
	value := aString read0xHexadecimal
]

{ #category : #equality }
FogTransaction >> valuesToCompareForEquality [
	^ {hash}
]
