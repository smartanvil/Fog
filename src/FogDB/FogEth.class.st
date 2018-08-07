"
ETHEthereumAPI  relative 
"
Class {
	#name : #FogEth,
	#superclass : #FogAPIAccess,
	#category : 'FogDB-API'
}

{ #category : #accessing }
FogEth >> accounts [
	^ self send: api messageAccounts
]

{ #category : #accessing }
FogEth >> blockNumber [
	^ (self send: api messageBlockNumber) asBKNumber 
	
]

{ #category : #'ffi-calls' }
FogEth >> call: var1 [
	^ self send: (api messageCall: var1)
]

{ #category : #'as yet unclassified' }
FogEth >> call: anETHCallDefinition block: aString [
	^ self send: (api messageCall: anETHCallDefinition block: aString)
]

{ #category : #'as yet unclassified' }
FogEth >> coinBase [
	^ self send: api messageCoinBase
]

{ #category : #compiling }
FogEth >> compileLLL: var1 [
	^ self send: (api messageCompileLLL: var1)
]

{ #category : #compiling }
FogEth >> compileSerpent: var1 [
	^ self send: (api messageCompileSerpent: var1)
]

{ #category : #compiling }
FogEth >> compileSolidity: sourceCode [
	^ self send: (api messageCompileSolidity: sourceCode)
]

{ #category : #'as yet unclassified' }
FogEth >> estimateGas: var1 [
	^ self send: (api messageEstimateGas: var1)
	
]

{ #category : #accessing }
FogEth >> gasPrice [
	^ self send: api messageGasPrice
]

{ #category : #'as yet unclassified' }
FogEth >> getBalance: var1 blockNumber: var2 [
	^ self send: (api messageGetBalance: var1 blockNumber: var2)
]

{ #category : #'as yet unclassified' }
FogEth >> getBalance: var1 blockTag: var2 [
	^ self send: (api messageGetBalance: var1 blockTag: var2)
]

{ #category : #'as yet unclassified' }
FogEth >> getBlockByHash: aBlockHash full: aBoolean [
	^ self send: (api messageGetBlockByHash: aBlockHash full: aBoolean)
]

{ #category : #'as yet unclassified' }
FogEth >> getBlockByNumber: aBlockNumber full: aBoolean [
	^ self send: (api messageGetBlockByNumber: aBlockNumber full: aBoolean)
]

{ #category : #'as yet unclassified' }
FogEth >> getBlockByTag: aTag full: aBoolean [
	^ self send: (api messageGetBlockByTag: aTag full: aBoolean)
]

{ #category : #'as yet unclassified' }
FogEth >> getBlockTransactionCountByHash: var1 [
	^ self send: (api messageGetBlockTransactionCountByHash: var1)
]

{ #category : #'as yet unclassified' }
FogEth >> getBlockTransactionCountByNumber: var1 [
	^ self send: (api messageGetBlockTransactionCountByNumber: var1)
]

{ #category : #'as yet unclassified' }
FogEth >> getCompilers [
	^ self send: api messageGetCompilers
]

{ #category : #'as yet unclassified' }
FogEth >> getContractCode: aContractAddress blockNumber: aBlockNumber [
	| code |
	code := self send: (api messageGetCode: aContractAddress blockNumber: aBlockNumber).
	^ code = '0x'
		ifTrue: [ nil ]
		ifFalse: [ code ]
]

{ #category : #'as yet unclassified' }
FogEth >> getContractCode: aContractAddress blockTag: aBlockTag [
	| code |
	code := self send: (api messageGetCode: aContractAddress blockTag: aBlockTag).
	^ code = '0x'
		ifTrue: [ nil ]
		ifFalse: [ code ]
]

{ #category : #'as yet unclassified' }
FogEth >> getFilterChanges: var1 [
	^ self send: (api messageGetFilterChanges: var1)
]

{ #category : #'as yet unclassified' }
FogEth >> getFilterLogs: var1 [
	^ self send: (api messageGetFilterLogs: var1)
]

{ #category : #'as yet unclassified' }
FogEth >> getLogs: var1 [
	^ self send: (api messageGetLogs: var1)
]

{ #category : #unifing }
FogEth >> getStorageAt: aContractAddress upTo: aSlotId block: aBlockTagOrNumberOrHash [
	^ (#(latest earliest pending) includes: aBlockTagOrNumberOrHash)
		ifTrue: [ self getStorageAt: aContractAddress upTo: aSlotId blockTag: aBlockTagOrNumberOrHash ]
		ifFalse: [ self getStorageAt: aContractAddress upTo: aSlotId blockNumber: aBlockTagOrNumberOrHash ]
]

{ #category : #accessing }
FogEth >> getStorageAt: var1 upTo: var2 blockNumber: var3 [
	^ self send: (api messageGetStorageAt: var1 upTo: var2 blockNumber: var3)
]

{ #category : #accessing }
FogEth >> getStorageAt: var1 upTo: var2 blockTag: var3 [
	^ self send: (api messageGetStorageAt: var1 upTo: var2 blockTag: var3)
]

{ #category : #'as yet unclassified' }
FogEth >> getTransactionByBlockHash: aBlockHash andIndex: aTxIndex [
	^ self
		send: (api messageGetTransactionByBlockHash: aBlockHash andIndex: aTxIndex)
]

{ #category : #'as yet unclassified' }
FogEth >> getTransactionByBlockNumber: aBlockNumber andIndex: anIndex [
	^ self
		send: (api messageGetTransactionByBlockNumber: aBlockNumber andIndex: anIndex)
]

{ #category : #'as yet unclassified' }
FogEth >> getTransactionByBlockTag: aBlockTag andIndex: anIndex [
	^ self
		send: (api messageGetTransactionByBlockTag: aBlockTag andIndex: anIndex)
]

{ #category : #'as yet unclassified' }
FogEth >> getTransactionByHash: aTxHash [
	^ self send: (api messageGetTransactionByHash: aTxHash)
]

{ #category : #'as yet unclassified' }
FogEth >> getTransactionCount: var1 blockNumber: var2 [
	^ self send: (api messageGetTransactionCount: var1 blockNumber: var2)
]

{ #category : #'as yet unclassified' }
FogEth >> getTransactionCount: var1 blockTag: var2 [
	^ self send: (api messageGetTransactionCount: var1 blockTag: var2)
]

{ #category : #'as yet unclassified' }
FogEth >> getTransactionReceipt: var1 [
	^ self send: (api messageGetTransactionReceipt: var1)
]

{ #category : #'as yet unclassified' }
FogEth >> getUncleByBlockHash: var1 andIndex: var2 [
	^ self send: (api messageGetUncleByBlockHash: var1 andIndex: var2)
]

{ #category : #'as yet unclassified' }
FogEth >> getUncleByBlockNumber: var1 andIndex: var2 [
	^ self send: (api messageGetUncleByBlockNumber: var1 andIndex: var2)
]

{ #category : #'as yet unclassified' }
FogEth >> getUncleByBlockTag: var1 andIndex: var2 [
	^ self send: (api messageGetUncleByBlockTag: var1 andIndex: var2)
]

{ #category : #'as yet unclassified' }
FogEth >> getUncleCountByBlockHash: var1 [
	^ self send: (api messageGetUncleCountByBlockHash: var1)
]

{ #category : #'as yet unclassified' }
FogEth >> getWork [
	^ self send: api messageGetWork
]

{ #category : #'as yet unclassified' }
FogEth >> hashrate [
	^ self send: api messageHashrate
]

{ #category : #'as yet unclassified' }
FogEth >> mining [
	^ self send: api messageMining
]

{ #category : #'instance creation' }
FogEth >> newBlockFilter [
	^ self send: api messageNewBlockFilter
]

{ #category : #'instance creation' }
FogEth >> newFilter: var1 [
	^ self send: (api messageNewFilter: var1)
]

{ #category : #'instance creation' }
FogEth >> newPendingTransactionFilter [
	^ self send: api messageNewPendingTransactionFilter
]

{ #category : #'rpc call' }
FogEth >> protocolVersion [
	^ self send: api messageProtocolVersion
]

{ #category : #'as yet unclassified' }
FogEth >> sendRawTransaction: var1 [
	^ self send: (api messageSendRawTransaction: var1)
]

{ #category : #'as yet unclassified' }
FogEth >> sendTransaction: var1 [
	^ self send: (api messageSendTransaction: var1)
]

{ #category : #initialization }
FogEth >> setApi [
	api := FogEthereumAPI new
]

{ #category : #'as yet unclassified' }
FogEth >> signWith: var1 sha3Data: var2 [
	^ self send: (api messageSignWith: var1 sha3Data: var2)
]

{ #category : #'as yet unclassified' }
FogEth >> submitHashrate: var1 clientId: var2 [
	^ self send: (api messageSubmitHashrate: var1 clientId: var2)
]

{ #category : #'as yet unclassified' }
FogEth >> submitWork: var1 header: var2 digest: var3 [
	^ self send: (api messageSubmitWork: var1 header: var2 digest: var3)
]

{ #category : #'as yet unclassified' }
FogEth >> syncing [
	^ self send: self messageSyncing
]

{ #category : #'as yet unclassified' }
FogEth >> uninstallFilterID: var1 [
	^ self send: (self messageUninstallFilterID: var1)
]
