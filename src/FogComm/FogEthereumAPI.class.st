"
Ethereum subset of RPC Calls 
"
Class {
	#name : #FogEthereumAPI,
	#superclass : #Object,
	#category : 'FogComm-API'
}

{ #category : #'as yet unclassified' }
FogEthereumAPI >> hexa: aNumber [
	^ (aNumber isString and: [ aNumber beginsWith: '0x' ])
		ifTrue: [ aNumber ]
		ifFalse: [ aNumber asBKHexa ]
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageAccounts [
	^ FogMessage new
		method: 'eth_accounts';
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageBlockNumber [
	^ FogMessage new
		method: 'eth_blockNumber';
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageCall: aETHCallDefinition [
	^ FogMessage new
		method: 'eth_call';
		parameters: {aETHCallDefinition};
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageCall: aETHCallDefinition block: blockRef [
	^ FogMessage new
		method: 'eth_call';
		parameters:
			{aETHCallDefinition.
			blockRef};
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageCoinBase [
	^ FogMessage new
		method: 'eth_coinbase';
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageCompileLLL: aLLLSourceCodeString [
	^ FogMessage new
		method: 'eth_compileLLL';
		parameters: {aLLLSourceCodeString};
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageCompileSerpent: aSourceCodeString [ 
^ FogMessage new
		method: 'eth_compileSerpent';
		parameters: {aSourceCodeString};
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageCompileSolidity: aSourceCodeString [
	^ FogMessage new
		method: 'eth_compileSolidity';
		parameters: {aSourceCodeString};
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageEstimateGas: aETHCallDefinition [
	^ FogMessage new
		method: 'eth_estimateGas';
		parameters: {aETHCallDefinition};
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGasPrice [
		^ FogMessage new
		method: 'eth_gasPrice';
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGetBalance: anAccountHash blockNumber: anInteger [
	^ FogMessage new
		method: 'eth_getBalance';
		parameters:
			{anAccountHash.
			(self hexa: anInteger)};
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGetBalance: anAccountHash blockTag: aBlockTag [
	^ FogMessage new
		method: 'eth_getBalance';
		parameters:
			{anAccountHash.
			aBlockTag};
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGetBlockByHash: aBlockHashID full: aBoolean [
	^ FogMessage new
		method: 'eth_getBlockByHash';
		parameters:
			{aBlockHashID.
			aBoolean};
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGetBlockByNumber: aBlockNumber full: aBoolean [
	^ FogMessage new
		method: 'eth_getBlockByNumber';
		parameters:
			{(self hexa: aBlockNumber).
			aBoolean};
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGetBlockByTag: aTag full: aBoolean [
	^ FogMessage new
		method: 'eth_getBlockByNumber';
		parameters:
			{aTag.
			aBoolean};
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGetBlockTransactionCountByHash: aBlockHashID [
	^ FogMessage new
		method: 'eth_getBlockTransactionCountByHash';
		parameters: {aBlockHashID};
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGetBlockTransactionCountByNumber: aBlockNumber [
	^ FogMessage new
		method: 'eth_getBlockTransactionCountByNumber';
		parameters: {(self hexa: aBlockNumber)};
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGetCode: anAddress blockNumber: aBlockNumber [
	^ FogMessage new
		method: 'eth_getCode';
		parameters:
			{anAddress.
			(self hexa: aBlockNumber)};
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGetCode: anAddress blockTag: aBlockTag [
	^ FogMessage new
		method: 'eth_getCode';
		parameters:
			{anAddress.
			aBlockTag};
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGetCompilers [
	^ FogMessage new
		method: 'eth_getCompilers';
		parameters: {};
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGetFilterChanges: aFilterId [
	^ FogMessage new
		method: 'eth_getFilterChanges';
		parameters: {(self hexa: aFilterId)};
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGetFilterLogs: aFilterId [
	^ FogMessage new
		method: 'eth_getFilterLogs';
		parameters: {(self hexa: aFilterId)};
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGetLogs: aETHFilterDefinition [
	^ FogMessage new
		method: 'eth_getLogs';
		parameters: {aETHFilterDefinition};
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGetStorageAt: anAddress upTo: anAmountOfBytes blockNumber: aBlockNumber [
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
	^ FogMessage new
		method: 'eth_getTransactionByBlockHashAndIndex';
		parameters:
			{aBlockHash.
			(self hexa: anIndex)};
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGetTransactionByBlockNumber: aBlockNumber andIndex: anIndex [
	^ FogMessage new
		method: 'eth_getTransactionByBlockNumberAndIndex';
		parameters:
			{(self hexa: aBlockNumber).
			(self hexa: anIndex)};
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGetTransactionByBlockTag: aBlockTag andIndex: anIndex [
	^ FogMessage new
		method: 'eth_getTransactionByBlockNumberAndIndex';
		parameters:
			{aBlockTag.
			(self hexa: anIndex)};
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGetTransactionByHash: aTransactionHash [
	^ FogMessage new
		method: 'eth_getTransactionByHash';
		parameters: {aTransactionHash};
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGetTransactionCount: anAccountAddress blockNumber: aBlockNumber [
	^ FogMessage new
		method: 'eth_getTransactionCount';
		parameters:
			{anAccountAddress.
			(self hexa: aBlockNumber)};
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGetTransactionCount: anAccountAddress blockTag: aBlockTag [
	^ FogMessage new
		method: 'eth_getTransactionCount';
		parameters:
			{anAccountAddress.
			aBlockTag};
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGetTransactionReceipt: aTransactionHash [
	^ FogMessage new
		method: 'eth_getTransactionReceipt';
		parameters: {aTransactionHash};
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGetUncleByBlockHash: aBlockHash andIndex: anIndex [
	^ FogMessage new
		method: 'eth_getUncleByBlockHashAndIndex';
		parameters:
			{aBlockHash.
			(self hexa: anIndex)};
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGetUncleByBlockNumber: aBlockNumber andIndex: anIndex [
	^ FogMessage new
		method: 'eth_getUncleByBlockNumberAndIndex';
		parameters:
			{(self hexa: aBlockNumber).
			(self hexa: anIndex)};
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGetUncleByBlockTag: aBlockTag andIndex: anIndex [
	^ FogMessage new
		method: 'eth_getUncleByBlockNumberAndIndex';
		parameters:
			{aBlockTag.
			(self hexa: anIndex)};
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGetUncleCountByBlockHash: aBlockHash [
	^ FogMessage new
		method: 'eth_getUncleCountByBlockHash';
		parameters: {aBlockHash};
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGetWork [
	^ FogMessage new
		method: 'eth_getWork';
		parameters: {};
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageHashrate [
	^ FogMessage new
		method: 'eth_hashrate';
		parameters: {};
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageMining [
	^ FogMessage new
		method: 'eth_mining';
		parameters: {};
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageNewBlockFilter [
	^ FogMessage new
		method: 'eth_newBlockFilter';
		parameters: {};
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageNewFilter: aETHFilterDefinition [
	^ FogMessage new
		method: 'eth_newFilter';
		parameters: {aETHFilterDefinition};
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageNewPendingTransactionFilter [
	^ FogMessage new
		method: 'eth_newPendingTransactionFilter';
		parameters: {};
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageProtocolVersion [
	^ FogMessage new
		method: 'eth_protocolVersion';
		parameters: {};
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageSendRawTransaction: aCodeOrCall [
	^ FogMessage new
		method: 'eth_sendRawTransaction';
		parameters: {aCodeOrCall};
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageSendTransaction: aETHCallDefinition [
	^ FogMessage new
		method: 'eth_sendTransaction';
		parameters: {aETHCallDefinition};
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageSignWith: anAccount sha3Data: aDataSha [
	^ FogMessage new
		method: 'eth_sign';
		parameters:
			{anAccount.
			aDataSha};
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageSubmitHashrate: aHashRateIn32BytesHexa clientId: aClientUUID [
	^ FogMessage new
		method: 'eth_submitHashrate';
		parameters:
			{aHashRateIn32BytesHexa.
			aClientUUID};
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageSubmitWork: aCryptoNonce header: aBlockPoWHash digest: aDigest [
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
	^ FogMessage new
		method: 'eth_syncing';
		parameters: {};
		yourself
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageUninstallFilterID: aFilterId [
	^ FogMessage new
		method: 'eth_uninstallFilter';
		parameters: {(self hexa: aFilterId)};
		yourself
]
