"
This connection attaches a regular cache 
"
Class {
	#name : #FogCachedSession,
	#superclass : #FogSession,
	#instVars : [
		'cache'
	],
	#category : 'FogLive-Session'
}

{ #category : #accessing }
FogCachedSession >> cache [
	<doc: 'It returns the Cache used by the session. The default is the singleton located in FogCache current. '>
	^ cache ifNil: [ FogCache current ]
]

{ #category : #accessing }
FogCachedSession >> finalize [
	super finalize.
	cache := nil
]

{ #category : #'access db - accounts' }
FogCachedSession >> findAccountByHash: hashAccount blockHash: aBlockHash [
	^ self cache
		detectAccount: hashAccount asAddress
		ifNoneCreate: [ super findAccountByHash: hashAccount blockHash: aBlockHash ]
]

{ #category : #'access db - accounts' }
FogCachedSession >> findAccountByHash: hashAccount blockNumber: aBlockNumber [
	^ self cache
		detectAccount: hashAccount asAddress
		ifNoneCreate: [ super findAccountByHash: hashAccount blockNumber: aBlockNumber ]
]

{ #category : #'access db - accounts' }
FogCachedSession >> findAccountByHash: aString blockTag: aBlockTag [
	^  self cache 
		detectAccount: aString asAddress 
		ifNoneCreate: [ super findAccountByHash: aString blockTag: aBlockTag ]
]

{ #category : #'access db - blocks' }
FogCachedSession >> findBlockByHash: aBlockHash full: aBoolean [
	^ self cache
		detectBlocks: aBlockHash
		ifNoneCreate: [ super findBlockByHash: aBlockHash full: aBoolean ]
]

{ #category : #'access db - blocks' }
FogCachedSession >> findBlockByNumber: aBlockNumber full: aBoolean [
	^ self cache
		scanBlocks: [ :b | b number = aBlockNumber and: [ b full = aBoolean ] ]
		ifNoneCreate: [ super findBlockByNumber: aBlockNumber full: aBoolean ]
]

{ #category : #'access db - blocks' }
FogCachedSession >> findBlockByTag: aTag full: aBoolean [
	| block |
	block := super findBlockByTag: aTag full: aBoolean.
	^ self cache detectBlocks: block privateBlockHash ifNoneCreate: [ block ]
]

{ #category : #'access db - contract' }
FogCachedSession >> findContractDescriptionForBinaryCode: aCode [
	^  self cache  scanContractDescriptions: [ :a | a codeMatchesWith: aCode ] ifNoneCreate: [ super findContractDescriptionForBinaryCode: aCode ]
	
]

{ #category : #'access db - contract' }
FogCachedSession >> findContractInstanceByHash: aContractAddress blockHash: aBlockHash [
	^ self cache
		detectContractBind: aContractAddress asAddress
		ifNoneCreate: [ super
				findContractInstanceByHash: aContractAddress
				blockHash: aBlockHash ]
]

{ #category : #'access db - contract' }
FogCachedSession >> findContractInstanceByHash: aContractAddress blockNumber: aBlockNumber [
	^  self cache 
		detectContractBind: aContractAddress asAddress 
		ifNoneCreate: [ super
				findContractInstanceByHash: aContractAddress
				blockNumber: aBlockNumber ]
]

{ #category : #'access db - contract' }
FogCachedSession >> findContractInstanceByHash: aContractAddress blockTag: aBlockNumber [
	^  self cache 
		detectContractBind:  aContractAddress asAddress 
		ifNoneCreate: [ super
				findContractInstanceByHash: aContractAddress
				blockTag: aBlockNumber ]
]

{ #category : #'access db - transactions' }
FogCachedSession >> findTransactionByBlockHash: aBlockHash andIndex: aTxIndex [
	| tx |
	tx := super findTransactionByBlockHash: aBlockHash andIndex: aTxIndex.
	^ self cache detectTransactions: tx privateTransactionHash ifNoneCreate: [ tx ]
]

{ #category : #'access db - transactions' }
FogCachedSession >> findTransactionByBlockNumber: aBlockNumber andIndex: anIndex [
	| tx |
	tx := super findTransactionByBlockNumber: aBlockNumber andIndex: anIndex.
	^ self cache detectTransactions: tx privateTransactionHash ifNoneCreate: [ tx ]
]

{ #category : #'access db - transactions' }
FogCachedSession >> findTransactionByBlockTag: aBlockTag andIndex: anIndex [
	| tx |
	tx := super findTransactionByBlockTag: aBlockTag andIndex: anIndex.
	^ self cache detectTransactions: tx privateTransactionHash ifNoneCreate: [ tx ]
]

{ #category : #'access db - transactions' }
FogCachedSession >> findTransactionByDescription: aTransactionDescription [
	^ self cache
		detectTransactions: (aTransactionDescription at: #hash)
		ifNoneCreate: [ super findTransactionByDescription: aTransactionDescription ]
]

{ #category : #'access db - transactions' }
FogCachedSession >> findTransactionByHash: aTransactionHash [
	^ self cache
		detectTransactions: aTransactionHash
		ifNoneCreate: [ super findTransactionByHash: aTransactionHash ]
]

{ #category : #'access db - contract' }
FogCachedSession >> registerInstantiationWithReceipt: transactionHash ofContractDescription: aContractDescription [
	^ self cache
		registerContractBind:
			(super
				registerInstantiationWithReceipt: transactionHash
				ofContractDescription: aContractDescription)
]
