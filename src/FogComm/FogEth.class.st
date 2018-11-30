"
ETHEthereumAPI  relative 
"
Class {
	#name : #FogEth,
	#superclass : #FogAPIAccess,
	#category : #'FogComm-API'
}

{ #category : #accessing }
FogEth >> accounts [
		<doc: 'Returns a list of addresses owned by client.'>
		^ self send: api messageAccounts
]

{ #category : #accessing }
FogEth >> blockNumber [
		<doc: 'Returns the number of most recent block.'>
		^ (self send: api messageBlockNumber) asBKNumber 
	
]

{ #category : #'ffi-calls' }
FogEth >> call: var1 [
		<doc: 'Executes a new message call immediately without creating a transaction on the block chain.'>
		^ self send: (api messageCall: var1)
]

{ #category : #'as yet unclassified' }
FogEth >> call: anETHCallDefinition block: aString [
		<doc: 'Executes a new message call immediately without creating a transaction on the block chain.'>
		^ self send: (api messageCall: anETHCallDefinition block: aString)
]

{ #category : #'as yet unclassified' }
FogEth >> coinBase [
		<doc: 'Returns the client coinbase address.'>
		^ self send: api messageCoinBase
]

{ #category : #compiling }
FogEth >> compileLLL: var1 [
		<doc: 'Returns compiled LLL code.'>
		^ self send: (api messageCompileLLL: var1)
]

{ #category : #compiling }
FogEth >> compileSerpent: var1 [
		<doc: 'Returns compiled serpent code.'>
		^ self send: (api messageCompileSerpent: var1)
]

{ #category : #compiling }
FogEth >> compileSolidity: sourceCode [
		<doc: 'Returns compiled solidity code.'>
		^ self send: (api messageCompileSolidity: sourceCode)
]

{ #category : #'as yet unclassified' }
FogEth >> estimateGas: var1 [
		<doc: 'Generates and returns an estimate of how much gas is necessary to allow the transaction to complete. The transaction will not be added to the blockchain. Note that the estimate may be significantly more than the amount of gas actually used by the transaction, for a variety of reasons including EVM mechanics and node performance.'>
		^ self send: (api messageEstimateGas: var1)
	
]

{ #category : #accessing }
FogEth >> gasPrice [
		<doc: 'Returns the current price per gas in wei.'>
		^ self send: api messageGasPrice
]

{ #category : #'as yet unclassified' }
FogEth >> getBalance: var1 blockNumber: var2 [
	<doc: 'Returns the balance of the account of given address.'>
	^ self send: (api messageGetBalance: var1 blockNumber: var2)
]

{ #category : #'as yet unclassified' }
FogEth >> getBalance: var1 blockTag: var2 [
	<doc: 'Returns the balance of the account of given address.'>
	^ self send: (api messageGetBalance: var1 blockTag: var2)
]

{ #category : #'as yet unclassified' }
FogEth >> getBlockByHash: aBlockHash full: aBoolean [
		<doc: 'Returns information about a block by hash.'>
		^ self send: (api messageGetBlockByHash: aBlockHash full: aBoolean)
]

{ #category : #'as yet unclassified' }
FogEth >> getBlockByNumber: aBlockNumber full: aBoolean [
		<doc: 'Returns information about a block by block number.'>
		^ self send: (api messageGetBlockByNumber: aBlockNumber full: aBoolean)
]

{ #category : #'as yet unclassified' }
FogEth >> getBlockByTag: aTag full: aBoolean [
	<doc: 'Returns information about a block by block number.'>
	^ self send: (api messageGetBlockByTag: aTag full: aBoolean)
]

{ #category : #'as yet unclassified' }
FogEth >> getBlockTransactionCountByHash: var1 [
	<doc: 'Returns the number of transactions in a block from a block matching the given block hash.'>
	^ self send: (api messageGetBlockTransactionCountByHash: var1)
]

{ #category : #'as yet unclassified' }
FogEth >> getBlockTransactionCountByNumber: var1 [
		<doc: 'Returns the number of transactions in a block matching the given block number.'>
		^ self send: (api messageGetBlockTransactionCountByNumber: var1)
]

{ #category : #'as yet unclassified' }
FogEth >> getCompilers [
		<doc: 'Returns a list of available compilers in the client.'>
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
		<doc: 'Polling method for a filter, which returns an array of logs which occurred since last poll.'>
		^ self send: (api messageGetFilterChanges: var1)
]

{ #category : #'as yet unclassified' }
FogEth >> getFilterLogs: var1 [
		<doc: 'Returns an array of all logs matching filter with given id.'>
		^ self send: (api messageGetFilterLogs: var1)
]

{ #category : #'as yet unclassified' }
FogEth >> getLogs: var1 [
		<doc: 'Returns an array of all logs matching a given filter object.'>
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
		<doc: 'Returns the value from a storage position at a given address.'>
		^ self send: (api messageGetStorageAt: var1 upTo: var2 blockNumber: var3)
]

{ #category : #accessing }
FogEth >> getStorageAt: var1 upTo: var2 blockTag: var3 [
		<doc: 'Returns the value from a storage position at a given address.'>
		^ self send: (api messageGetStorageAt: var1 upTo: var2 blockTag: var3)
]

{ #category : #'as yet unclassified' }
FogEth >> getTransactionByBlockHash: aBlockHash andIndex: aTxIndex [
		<doc: 'Returns information about a transaction by block hash and transaction index position.'>
		^ self
		send: (api messageGetTransactionByBlockHash: aBlockHash andIndex: aTxIndex)
]

{ #category : #'as yet unclassified' }
FogEth >> getTransactionByBlockNumber: aBlockNumber andIndex: anIndex [
		<doc: 'Returns information about a transaction by block number and transaction index position.'>
		^ self
		send: (api messageGetTransactionByBlockNumber: aBlockNumber andIndex: anIndex)
]

{ #category : #'as yet unclassified' }
FogEth >> getTransactionByBlockTag: aBlockTag andIndex: anIndex [
		<doc: 'Returns information about a transaction by block number and transaction index position.'>
		^ self
		send: (api messageGetTransactionByBlockTag: aBlockTag andIndex: anIndex)
]

{ #category : #'as yet unclassified' }
FogEth >> getTransactionByHash: aTxHash [
		<doc: 'Returns the information about a transaction requested by transaction hash.'>
		^ self send: (api messageGetTransactionByHash: aTxHash)
]

{ #category : #'as yet unclassified' }
FogEth >> getTransactionCount: var1 blockNumber: var2 [
		<doc: 'Returns the number of transactions <em>sent</em> from an address.'>
		^ self send: (api messageGetTransactionCount: var1 blockNumber: var2)
]

{ #category : #'as yet unclassified' }
FogEth >> getTransactionCount: var1 blockTag: var2 [
		<doc: 'Returns the number of transactions <em>sent</em> from an address.'>
		^ self send: (api messageGetTransactionCount: var1 blockTag: var2)
]

{ #category : #'as yet unclassified' }
FogEth >> getTransactionReceipt: var1 [
		<doc: 'Returns the receipt of a transaction by transaction hash.'>
		^ self send: (api messageGetTransactionReceipt: var1)
]

{ #category : #'as yet unclassified' }
FogEth >> getUncleByBlockHash: var1 andIndex: var2 [
		<doc: 'Returns information about a uncle of a block by hash and uncle index position.'>
		^ self send: (api messageGetUncleByBlockHash: var1 andIndex: var2)
]

{ #category : #'as yet unclassified' }
FogEth >> getUncleByBlockNumber: var1 andIndex: var2 [
		<doc: 'Returns information about a uncle of a block by number and uncle index position.'>
		^ self send: (api messageGetUncleByBlockNumber: var1 andIndex: var2)
]

{ #category : #'as yet unclassified' }
FogEth >> getUncleByBlockTag: var1 andIndex: var2 [
		<doc: 'Returns information about a uncle of a block by number and uncle index position.'>
		^ self send: (api messageGetUncleByBlockTag: var1 andIndex: var2)
]

{ #category : #'as yet unclassified' }
FogEth >> getUncleCountByBlockHash: var1 [
		<doc: 'Returns the number of uncles in a block from a block matching the given block hash.'>
		^ self send: (api messageGetUncleCountByBlockHash: var1)
]

{ #category : #'as yet unclassified' }
FogEth >> getWork [
		<doc: 'Returns the hash of the current block, the seedHash, and the boundary condition to be met ("target").'>
		^ self send: api messageGetWork
]

{ #category : #'as yet unclassified' }
FogEth >> hashrate [
		<doc: 'Returns the number of hashes per second that the node is mining with.'>
		^ self send: api messageHashrate
]

{ #category : #'as yet unclassified' }
FogEth >> mining [
	<doc:'Returns <code>true</code> if client is actively mining new blocks.'>
		^ self send: api messageMining
]

{ #category : #'instance creation' }
FogEth >> newBlockFilter [
	<doc:'Creates a filter in the node, to notify when a new block arrives. To check if the state has changed, call <a href="#eth_getfilterchanges">eth_getFilterChanges</a>.'>
		^ self send: api messageNewBlockFilter
]

{ #category : #'instance creation' }
FogEth >> newFilter: var1 [
	<doc:'Creates a filter object, based on filter options, to notify when the state changes (logs). To check if the state has changed, call <a href="#eth_getfilterchanges">eth_getFilterChanges</a>.'>
		^ self send: (api messageNewFilter: var1)
]

{ #category : #'instance creation' }
FogEth >> newPendingTransactionFilter [
	<doc:'Creates a filter in the node, to notify when new pending transactions arrive. To check if the state has changed, call <a ref="#eth_getfilterchanges">eth_getFilterChanges</a>.'>
		^ self send: api messageNewPendingTransactionFilter
]

{ #category : #'rpc call' }
FogEth >> protocolVersion [
	<doc:'Returns the current ethereum protocol version.'>
		^ self send: api messageProtocolVersion
]

{ #category : #'as yet unclassified' }
FogEth >> sendRawTransaction: var1 [
	<doc:'Creates new message call transaction or a contract creation for signed transactions.'>
		^ self send: (api messageSendRawTransaction: var1)
]

{ #category : #'as yet unclassified' }
FogEth >> sendTransaction: var1 [
	<doc:'Creates new message call transaction or a contract creation, if the data field contains code.'>
		^ self send: (api messageSendTransaction: var1)
]

{ #category : #initialization }
FogEth >> setApi [
	api := FogEthereumAPI new
]

{ #category : #'as yet unclassified' }
FogEth >> signWith: var1 sha3Data: var2 [
	<doc:'The sign method calculates an Ethereum specific signature with: <code>sign(keccak256("\x19Ethereum Signed Message:\n" + len(message) + message)))</code>.'>
		^ self send: (api messageSignWith: var1 sha3Data: var2)
]

{ #category : #'as yet unclassified' }
FogEth >> submitHashrate: var1 clientId: var2 [
	<doc:'Used for submitting mining hashrate.'>
		^ self send: (api messageSubmitHashrate: var1 clientId: var2)
]

{ #category : #'as yet unclassified' }
FogEth >> submitWork: var1 header: var2 digest: var3 [
	<doc:'Used for submitting a proof-of-work solution.'>
		^ self send: (api messageSubmitWork: var1 header: var2 digest: var3)
]

{ #category : #'as yet unclassified' }
FogEth >> syncing [
	<doc:'Returns an object with data about the sync status or <code>false</code>.'>
		^ self send: self messageSyncing
]

{ #category : #'as yet unclassified' }
FogEth >> uninstallFilterID: var1 [
	<doc:'Uninstalls a filter with given id. Should always be called when watch is no longer needed. Additonally Filters timeout when they aren"t requested with <a href="#eth_getfilterchanges">eth_getFilterChanges</a> for a period of time.'>
		^ self send: (self messageUninstallFilterID: var1)
]
