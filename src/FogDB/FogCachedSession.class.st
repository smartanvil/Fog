"
This connection attaches a regular cache 
"
Class {
	#name : #FogCachedSession,
	#superclass : #FogSession,
	#instVars : [
		'cache'
	],
	#category : 'FogDB-Session'
}

{ #category : #accessing }
FogCachedSession >> cache [
	^ cache ifNil: [ FogCache current ]
]

{ #category : #accessing }
FogCachedSession >> finalize [
	super finalize.
	cache := nil
]

{ #category : #'access db - accounts' }
FogCachedSession >> findAccountByHash: hashAccount blockNumber: aBlockNumber [
	^ self cache
		detectAccount: [ :a | a privateAccountHash = hashAccount asAddress ]
		ifNoneCreate: [ super findAccountByHash: hashAccount blockNumber: aBlockNumber ]
]

{ #category : #'access db - accounts' }
FogCachedSession >> findAccountByHash: aString blockTag: aBlockTag [
	^  self cache 
		detectAccount: [ :a | a privateAccountHash = aString asAddress ]
		ifNoneCreate: [ super findAccountByHash: aString blockTag: aBlockTag ]
]

{ #category : #'access db - blocks' }
FogCachedSession >> findBlockByHash: aBlockHash full: aBoolean [
	^  self cache 
		detectBlocks: [ :b | b privateBlockHash = aBlockHash and: [ b isFull = aBoolean ] ]
		ifNoneCreate: [ super findBlockByHash: aBlockHash full: aBoolean ]
]

{ #category : #'access db - blocks' }
FogCachedSession >> findBlockByNumber: aBlockNumber full: aBoolean [
	^  self cache 
		detectBlocks: [ :b | b number = aBlockNumber and: [ b full = aBoolean ] ]
		ifNoneCreate: [ super findBlockByNumber: aBlockNumber full: aBoolean ]
]

{ #category : #'access db - blocks' }
FogCachedSession >> findBlockByTag: aTag full: aBoolean [
	| block |
	block := super findBlockByTag: aTag full: aBoolean.
	^  self cache 
		detectBlocks:
			[ :b | b privateBlockHash = block privateBlockHash and: [ b full = aBoolean ] ]
		ifNoneCreate: [ block ]
]

{ #category : #'access db - contract' }
FogCachedSession >> findContractDescriptionByName: aContractDescriptionName andVersionHash: aVersionHash [
	^ self cache
		detectContractDescriptions: [ :a | a versionHash = aVersionHash and: [ a name = aContractDescriptionName ] ]
		ifNoneCreate: [ super findContractDescriptionByName: aContractDescriptionName andVersionHash: aVersionHash ]
]

{ #category : #'access db - contract' }
FogCachedSession >> findContractDescriptionForBinaryCode: aCode [
	^  self cache  detectContractDescriptions: [ :a | a codeMatchesWith: aCode ] ifNoneCreate: [ super findContractDescriptionForBinaryCode: aCode ]
]

{ #category : #'access db - contract' }
FogCachedSession >> findContractInstanceByHash: aContractAddress blockNumber: aBlockNumber [
	^  self cache 
		detectContractBind: [ :instance | instance address = aContractAddress asAddress ]
		ifNoneCreate: [ super
				findContractInstanceByHash: aContractAddress
				blockNumber: aBlockNumber ]
]

{ #category : #'access db - contract' }
FogCachedSession >> findContractInstanceByHash: aContractAddress blockTag: aBlockNumber [
	^  self cache 
		detectContractBind: [ :instance | instance address = aContractAddress asAddress ]
		ifNoneCreate: [ super
				findContractInstanceByHash: aContractAddress
				blockNumber: aBlockNumber ]
]

{ #category : #'access db - contract' }
FogCachedSession >> findFileContractDescriptionByFileReference: aFileReference [
	^ self cache detectFileContractDescriptionsOrNil: [ :a | a fromFile = aFileReference ]
]

{ #category : #'access db - contract' }
FogCachedSession >> findFileContractDescriptionForCompilationOutput: description [
	^  self cache 
		detectContractDescriptions: [ :a | a codeMatchesWith: (description at: #runtime) ]
		ifNoneCreate: [ super findFileContractDescriptionForCompilationOutput: description ]
]

{ #category : #'access db - transactions' }
FogCachedSession >> findTransactionByBlockHash: aBlockHash andIndex: aTxIndex [
	| tx |
	tx := super findTransactionByBlockHash: aBlockHash andIndex: aTxIndex.
	^  self cache  detectTransactions: [ :t | t privateTransactionHash = tx privateTransactionHash ] ifNoneCreate: [ tx ]
]

{ #category : #'access db - transactions' }
FogCachedSession >> findTransactionByBlockNumber: aBlockNumber andIndex: anIndex [
	| tx |
	tx := super findTransactionByBlockNumber: aBlockNumber andIndex: anIndex.
	^  self cache  detectTransactions: [ :t | t privateTransactionHash = tx privateTransactionHash ] ifNoneCreate: [ tx ]
]

{ #category : #'access db - transactions' }
FogCachedSession >> findTransactionByBlockTag: aBlockTag andIndex: anIndex [
	| tx |
	tx := super findTransactionByBlockTag: aBlockTag andIndex: anIndex.
	^  self cache  detectTransactions: [ :t | t privateTransactionHash = tx privateTransactionHash ] ifNoneCreate: [ tx ]
]

{ #category : #'access db - transactions' }
FogCachedSession >> findTransactionByDescription: aTransactionDescription [
	^  self cache 
		detectTransactions: [ :t | t privateTransactionHash = (aTransactionDescription at: #hash) ]
		ifNoneCreate: [ super findTransactionByDescription: aTransactionDescription ]
]

{ #category : #'access db - transactions' }
FogCachedSession >> findTransactionByHash: aTransactionHash [
	^  self cache 
		detectTransactions: [ :t | t privateTransactionHash = aTransactionHash ]
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

{ #category : #accesing }
FogCachedSession >> sessionAccount [
	^ self findAccountByHash: '0x81bfba8301a073a010e9fb71fab514e53d1cc3f0' blockTag: #latest .
]
