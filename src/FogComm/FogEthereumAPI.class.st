"
Ethereum subset of RPC Calls 
https://github.com/ethereum/wiki/wiki/JSON-RPC#json-rpc-api-reference
"
Class {
	#name : #FogEthereumAPI,
	#superclass : #Object,
	#category : #'FogComm-API'
}

{ #category : #'as yet unclassified' }
FogEthereumAPI >> hexa: aNumber [
	^ (aNumber isString and: [ aNumber beginsWith: '0x' ])
		ifTrue: [ aNumber ]
		ifFalse: [ aNumber asBKHexa ]
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageAccounts [
	<doc: 'Returns a list of addresses owned by client.'>
	^ FogMessage new
		method: 'eth_accounts';
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageBlockNumber [
	<doc: 'Returns the number of most recent block.'>
	^ FogMessage new
		method: 'eth_blockNumber';
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageCall: aETHCallDefinition [
	<doc: 'Executes a new message call immediately without creating a transaction on the block chain.'>
	^ FogMessage new
		method: 'eth_call';
		parameters: {aETHCallDefinition};
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageCall: aETHCallDefinition block: blockRef [
	<doc: 'Executes a new message call immediately without creating a transaction on the block chain.'>
	^ FogMessage new
		method: 'eth_call';
		parameters:
			{aETHCallDefinition.
			blockRef};
		yourself
]

{ #category : #deprecated }
FogEthereumAPI >> messageCoinBase [
	<doc: 'Returns the client coinbase address.'>
	^ FogMessage new
		method: 'eth_coinbase';
		yourself
]

{ #category : #deprecated }
FogEthereumAPI >> messageCompileLLL: aLLLSourceCodeString [
	<doc: 'Returns compiled LLL code.'>
	^ FogMessage new
		method: 'eth_compileLLL';
		parameters: {aLLLSourceCodeString};
		yourself
]

{ #category : #deprecated }
FogEthereumAPI >> messageCompileSerpent: aSourceCodeString [
	<doc: 'Returns compiled serpent code.'>
	^ FogMessage new
		method: 'eth_compileSerpent';
		parameters: {aSourceCodeString};
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageCompileSolidity: aSourceCodeString [
	<doc: 'Returns compiled solidity code.'>
	^ FogMessage new
		method: 'eth_compileSolidity';
		parameters: {aSourceCodeString};
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageEstimateGas: aETHCallDefinition [
	<doc: 'Generates and returns an estimate of how much gas is necessary to allow the transaction to complete. The transaction will not be added to the blockchain. Note that the estimate may be significantly more than the amount of gas actually used by the transaction, for a variety of reasons including EVM mechanics and node performance.'>
	^ FogMessage new
		method: 'eth_estimateGas';
		parameters: {aETHCallDefinition};
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGasPrice [
	<doc: 'Returns the current price per gas in wei.'>
	^ FogMessage new
		method: 'eth_gasPrice';
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGetBalance: anAccountHash blockNumber: anInteger [
	<doc: 'Returns the balance of the account of given address.'>
	^ FogMessage new
		method: 'eth_getBalance';
		parameters:
			{anAccountHash.
			(self hexa: anInteger)};
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGetBalance: anAccountHash blockTag: aBlockTag [
	<doc: 'Returns the balance of the account of given address.'>
	^ FogMessage new
		method: 'eth_getBalance';
		parameters:
			{anAccountHash.
			aBlockTag};
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGetBlockByHash: aBlockHashID full: aBoolean [
	<doc: 'Returns information about a block by hash.'>
	^ FogMessage new
		method: 'eth_getBlockByHash';
		parameters:
			{aBlockHashID.
			aBoolean};
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGetBlockByNumber: aBlockNumber full: aBoolean [
	<doc: 'Returns information about a block by block number.'>
	^ FogMessage new
		method: 'eth_getBlockByNumber';
		parameters:
			{(self hexa: aBlockNumber).
			aBoolean};
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGetBlockByTag: aTag full: aBoolean [
	<doc: 'Returns information about a block by block number.'>
	^ FogMessage new
		method: 'eth_getBlockByNumber';
		parameters:
			{aTag.
			aBoolean};
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGetBlockTransactionCountByHash: aBlockHashID [
	<doc: 'Returns the number of transactions in a block from a block matching the given block hash.'>
	^ FogMessage new
		method: 'eth_getBlockTransactionCountByHash';
		parameters: {aBlockHashID};
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGetBlockTransactionCountByNumber: aBlockNumber [
	<doc: 'Returns the number of transactions in a block matching the given block number.'>
	^ FogMessage new
		method: 'eth_getBlockTransactionCountByNumber';
		parameters: {(self hexa: aBlockNumber)};
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGetCode: anAddress blockNumber: aBlockNumber [
	<doc: 'Returns code at a given address.'>
	^ FogMessage new
		method: 'eth_getCode';
		parameters:
			{anAddress.
			(self hexa: aBlockNumber)};
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGetCode: anAddress blockTag: aBlockTag [
	<doc: 'Returns code at a given address.'>
	^ FogMessage new
		method: 'eth_getCode';
		parameters:
			{anAddress.
			aBlockTag};
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGetCompilers [
	<doc: 'Returns a list of available compilers in the client.'>
	^ FogMessage new
		method: 'eth_getCompilers';
		parameters: {};
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGetFilterChanges: aFilterId [
	<doc: 'Polling method for a filter, which returns an array of logs which occurred since last poll.'>
	^ FogMessage new
		method: 'eth_getFilterChanges';
		parameters: {(self hexa: aFilterId)};
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGetFilterLogs: aFilterId [
	<doc: 'Returns an array of all logs matching filter with given id.'>
	^ FogMessage new
		method: 'eth_getFilterLogs';
		parameters: {(self hexa: aFilterId)};
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGetLogs: aETHFilterDefinition [
	<doc: 'Returns an array of all logs matching a given filter object.'>
	^ FogMessage new
		method: 'eth_getLogs';
		parameters: {aETHFilterDefinition};
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGetStorageAt: anAddress upTo: anAmountOfBytes blockNumber: aBlockNumber [
	<doc: 'Returns the value from a storage position at a given address.'>
	^ FogMessage new
		method: 'eth_getStorageAt';
		parameters:
			{anAddress.
			(self hexa: anAmountOfBytes).
			(self hexa: aBlockNumber)};
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGetStorageAt: anAddress upTo: anAmountOfBytes blockTag: aBlockTag [
	<doc: 'Returns the value from a storage position at a given address.'>
	^ FogMessage new
		method: 'eth_getStorageAt';
		parameters:
			{anAddress.
			(self hexa: anAmountOfBytes).
			aBlockTag};
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGetTransactionByBlockHash: aBlockHash andIndex: anIndex [
	<doc: 'Returns information about a transaction by block hash and transaction index position.'>
	^ FogMessage new
		method: 'eth_getTransactionByBlockHashAndIndex';
		parameters:
			{aBlockHash.
			(self hexa: anIndex)};
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGetTransactionByBlockNumber: aBlockNumber andIndex: anIndex [
	<doc: 'Returns information about a transaction by block number and transaction index position.'>
	^ FogMessage new
		method: 'eth_getTransactionByBlockNumberAndIndex';
		parameters:
			{(self hexa: aBlockNumber).
			(self hexa: anIndex)};
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGetTransactionByBlockTag: aBlockTag andIndex: anIndex [
	<doc: 'Returns information about a transaction by block number and transaction index position.'>
	^ FogMessage new
		method: 'eth_getTransactionByBlockNumberAndIndex';
		parameters:
			{aBlockTag.
			(self hexa: anIndex)};
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGetTransactionByHash: aTransactionHash [
	<doc: 'Returns the information about a transaction requested by transaction hash.'>
	^ FogMessage new
		method: 'eth_getTransactionByHash';
		parameters: {aTransactionHash};
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGetTransactionCount: anAccountAddress blockNumber: aBlockNumber [
	<doc: 'Returns the number of transactions <em>sent</em> from an address.'>
	^ FogMessage new
		method: 'eth_getTransactionCount';
		parameters:
			{anAccountAddress.
			(self hexa: aBlockNumber)};
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGetTransactionCount: anAccountAddress blockTag: aBlockTag [
	<doc: 'Returns the number of transactions <em>sent</em> from an address.'>
	^ FogMessage new
		method: 'eth_getTransactionCount';
		parameters:
			{anAccountAddress.
			aBlockTag};
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGetTransactionReceipt: aTransactionHash [
	<doc: 'Returns the receipt of a transaction by transaction hash.'>
	^ FogMessage new
		method: 'eth_getTransactionReceipt';
		parameters: {aTransactionHash};
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGetUncleByBlockHash: aBlockHash andIndex: anIndex [
	<doc: 'Returns information about a uncle of a block by hash and uncle index position.'>
	^ FogMessage new
		method: 'eth_getUncleByBlockHashAndIndex';
		parameters:
			{aBlockHash.
			(self hexa: anIndex)};
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGetUncleByBlockNumber: aBlockNumber andIndex: anIndex [
	<doc: 'Returns information about a uncle of a block by number and uncle index position.'>
	^ FogMessage new
		method: 'eth_getUncleByBlockNumberAndIndex';
		parameters:
			{(self hexa: aBlockNumber).
			(self hexa: anIndex)};
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGetUncleByBlockTag: aBlockTag andIndex: anIndex [
	<doc: 'Returns information about a uncle of a block by number and uncle index position.'>
	^ FogMessage new
		method: 'eth_getUncleByBlockNumberAndIndex';
		parameters:
			{aBlockTag.
			(self hexa: anIndex)};
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGetUncleCountByBlockHash: aBlockHash [
	<doc: 'Returns the number of uncles in a block from a block matching the given block hash.'>
	^ FogMessage new
		method: 'eth_getUncleCountByBlockHash';
		parameters: {aBlockHash};
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGetWork [
	<doc: 'Returns the hash of the current block, the seedHash, and the boundary condition to be met ("target").'>
	^ FogMessage new
		method: 'eth_getWork';
		parameters: {};
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageHashrate [
	<doc: 'Returns the number of hashes per second that the node is mining with.'>
	^ FogMessage new
		method: 'eth_hashrate';
		parameters: {};
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageMining [ 
<doc:'Returns <code>true</code> if client is actively mining new blocks.'>
	^ FogMessage new
		method: 'eth_mining';
		parameters: {};
		yourself

]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageNewBlockFilter [ 
<doc:'Creates a filter in the node, to notify when a new block arrives. To check if the state has changed, call <a href="#eth_getfilterchanges">eth_getFilterChanges</a>.'>
	^ FogMessage new
		method: 'eth_newBlockFilter';
		parameters: {};
		yourself

]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageNewFilter: aETHFilterDefinition [ 
<doc:'Creates a filter object, based on filter options, to notify when the state changes (logs). To check if the state has changed, call <a href="#eth_getfilterchanges">eth_getFilterChanges</a>.'>
	^ FogMessage new
		method: 'eth_newFilter';
		parameters: {aETHFilterDefinition};
		yourself

]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageNewPendingTransactionFilter [ 
<doc:'Creates a filter in the node, to notify when new pending transactions arrive. To check if the state has changed, call <a ref="#eth_getfilterchanges">eth_getFilterChanges</a>.'>
	^ FogMessage new
		method: 'eth_newPendingTransactionFilter';
		parameters: {};
		yourself

]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageProtocolVersion [ 
<doc:'Returns the current ethereum protocol version.'>
	^ FogMessage new
		method: 'eth_protocolVersion';
		parameters: {};
		yourself

]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageSendRawTransaction: aCodeOrCall [ 
<doc:'Creates new message call transaction or a contract creation for signed transactions.'>
	^ FogMessage new
		method: 'eth_sendRawTransaction';
		parameters: {aCodeOrCall};
		yourself

]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageSendTransaction: aETHCallDefinition [ 
<doc:'Creates new message call transaction or a contract creation, if the data field contains code.'>
	^ FogMessage new
		method: 'eth_sendTransaction';
		parameters: {aETHCallDefinition};
		yourself

]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageSignWith: anAccount sha3Data: aDataSha [ 
<doc:'The sign method calculates an Ethereum specific signature with: <code>sign(keccak256("\x19Ethereum Signed Message:\n" + len(message) + message)))</code>.'>
	^ FogMessage new
		method: 'eth_sign';
		parameters:
			{anAccount.
			aDataSha};
		yourself

]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageSubmitHashrate: aHashRateIn32BytesHexa clientId: aClientUUID [  
<doc:'Used for submitting mining hashrate.'>
	^ FogMessage new
		method: 'eth_submitHashrate';
		parameters:
			{aHashRateIn32BytesHexa.
			aClientUUID};
		yourself

]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageSubmitWork: aCryptoNonce header: aBlockPoWHash digest: aDigest [  
<doc:'Used for submitting a proof-of-work solution.'>
	^ FogMessage new
		method: 'eth_submitWork';
		parameters:
			{aCryptoNonce.
			aBlockPoWHash.
			aDigest};
		yourself

]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageSyncing [ 
<doc:'Returns an object with data about the sync status or <code>false</code>.'>
	^ FogMessage new
		method: 'eth_syncing';
		parameters: {};
		yourself

]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageUninstallFilterID: aFilterId [ 
<doc:'Uninstalls a filter with given id. Should always be called when watch is no longer needed. Additonally Filters timeout when they aren"t requested with <a href="#eth_getfilterchanges">eth_getFilterChanges</a> for a period of time.'>
	^ FogMessage new
		method: 'eth_uninstallFilter';
		parameters: {(self hexa: aFilterId)};
		yourself

]
