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
	#category : #'FogDB-Domain'
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

{ #category : #equality }
FogTransaction >> = anObject [
	self species = anObject species
		ifFalse: [ ^ false ].
	^ self valuesToCompareForEquality = anObject valuesToCompareForEquality
]

{ #category : #accessing }
FogTransaction >> accounts [
	^ {self to.
	self from}
]

{ #category : #accessing }
FogTransaction >> ammount [
	^ value
]

{ #category : #accessing }
FogTransaction >> block [
	^ block ifNil: [ block := self session findBlockByHash: blockHash full: true ]
]

{ #category : #accessing }
FogTransaction >> blockHash: aString [
	blockHash := aString
]

{ #category : #accessing }
FogTransaction >> blockNumber [
	^ blockNumber
]

{ #category : #accessing }
FogTransaction >> blockNumber: aString [
	blockNumber := aString asBKNumber
]

{ #category : #accessing }
FogTransaction >> from [
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
	^ fromAddress
]

{ #category : #accessing }
FogTransaction >> gas [
	^ gas
]

{ #category : #accessing }
FogTransaction >> gas: aString [
	gas := aString asBKNumber
]

{ #category : #accessing }
FogTransaction >> gasPrice [
	^ gasPrice
]

{ #category : #accessing }
FogTransaction >> gasPrice: aString [
	gasPrice := aString asBKNumber
]

{ #category : #equality }
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
	nonce := aString asBKNumber 
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
	^ self block timestamp
]

{ #category : #accessing }
FogTransaction >> to [
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
	^ toAddress
]

{ #category : #accessing }
FogTransaction >> transactionIndex [
	^ transactionIndex
]

{ #category : #accessing }
FogTransaction >> transactionIndex: aString [
	transactionIndex := aString asBKNumber
]

{ #category : #accessing }
FogTransaction >> v: aString [
	v := aString
]

{ #category : #accessing }
FogTransaction >> value: aString [
	value := aString asBKNumber
]

{ #category : #equality }
FogTransaction >> valuesToCompareForEquality [
	^ {hash}
]
