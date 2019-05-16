"
Ethereum subset of RPC Calls 

"
Class {
	#name : #FogEthereumAPI,
	#superclass : #Object,
	#category : #'FogComm-API'
}

{ #category : #'as yet unclassified' }
FogEthereumAPI >> hexa: aNumber [ 
	<doc:'Encodes a message entity for the RPC message '>
	^ (aNumber isString and: [ aNumber beginsWith: '0x' ])
		ifTrue: [ aNumber ]
		ifFalse: [ aNumber write0xHexadecimal ]
	
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageAccounts [ 
	<doc:'Encodes a message entity for the RPC message eth_accounts'>
	^ FogMessage new
		method: 'eth_accounts';
		yourself
	
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageBlockNumber [ 
	<doc:'Encodes a message entity for the RPC message eth_blockNumber'>
	^ FogMessage new
		method: 'eth_blockNumber';
		yourself
	
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageCall: aETHCallDefinition [ 
	<doc:'Encodes a message entity for the RPC message eth_call'>
	^ FogMessage new
		method: 'eth_call';
		parameters: {aETHCallDefinition};
		yourself
	
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageCall: aETHCallDefinition block: blockRef [ 
	<doc:'Encodes a message entity for the RPC message eth_call'>
	^ FogMessage new
		method: 'eth_call';
		parameters:
			{aETHCallDefinition.
			blockRef};
		yourself
	
]

{ #category : #deprecated }
FogEthereumAPI >> messageCoinBase [ 
	<doc:'Encodes a message entity for the RPC message eth_coinbase'>
	^ FogMessage new
		method: 'eth_coinbase';
		yourself
	
]

{ #category : #deprecated }
FogEthereumAPI >> messageCompileLLL: aLLLSourceCodeString [ 
	<doc:'Encodes a message entity for the RPC message eth_compileLLL'>
	^ FogMessage new
		method: 'eth_compileLLL';
		parameters: {aLLLSourceCodeString};
		yourself
	
]

{ #category : #deprecated }
FogEthereumAPI >> messageCompileSerpent: aSourceCodeString [ 
	<doc:'Encodes a message entity for the RPC message eth_compileSerpent'>
	^ FogMessage new
		method: 'eth_compileSerpent';
		parameters: {aSourceCodeString};
		yourself
	
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageCompileSolidity: aSourceCodeString [ 
	<doc:'Encodes a message entity for the RPC message eth_compileSolidity'>
	^ FogMessage new
		method: 'eth_compileSolidity';
		parameters: {aSourceCodeString};
		yourself
	
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageEstimateGas: aETHCallDefinition [ 
	<doc:'Encodes a message entity for the RPC message eth_estimateGas'>
	^ FogMessage new
		method: 'eth_estimateGas';
		parameters: {aETHCallDefinition};
		yourself
	
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGasPrice [ 
	<doc:'Encodes a message entity for the RPC message eth_gasPrice'>
	^ FogMessage new
		method: 'eth_gasPrice';
		yourself
	
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGetBalance: anAccountHash blockNumber: anInteger [ 
	<doc:'Encodes a message entity for the RPC message eth_getBalance'>
	^ FogMessage new
		method: 'eth_getBalance';
		parameters:
			{anAccountHash.
			(self hexa: anInteger)};
		yourself
	
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGetBalance: anAccountHash blockTag: aBlockTag [ 
	<doc:'Encodes a message entity for the RPC message eth_getBalance'>
	^ FogMessage new
		method: 'eth_getBalance';
		parameters:
			{anAccountHash.
			aBlockTag};
		yourself
	
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGetBlockByHash: aBlockHashID full: aBoolean [ 
	<doc:'Encodes a message entity for the RPC message eth_getBlockByHash'>
	^ FogMessage new
		method: 'eth_getBlockByHash';
		parameters:
			{aBlockHashID.
			aBoolean};
		yourself
	
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGetBlockByNumber: aBlockNumber full: aBoolean [ 
	<doc:'Encodes a message entity for the RPC message eth_getBlockByNumber'>
	^ FogMessage new
		method: 'eth_getBlockByNumber';
		parameters:
			{(self hexa: aBlockNumber).
			aBoolean};
		yourself
	
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGetBlockByTag: aTag full: aBoolean [ 
	<doc:'Encodes a message entity for the RPC message eth_getBlockByNumber'>
	^ FogMessage new
		method: 'eth_getBlockByNumber';
		parameters:
			{aTag.
			aBoolean};
		yourself
	
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGetBlockTransactionCountByHash: aBlockHashID [ 
	<doc:'Encodes a message entity for the RPC message eth_getBlockTransactionCountByHash'>
	^ FogMessage new
		method: 'eth_getBlockTransactionCountByHash';
		parameters: {aBlockHashID};
		yourself
	
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGetBlockTransactionCountByNumber: aBlockNumber [ 
	<doc:'Encodes a message entity for the RPC message eth_getBlockTransactionCountByNumber'>
	^ FogMessage new
		method: 'eth_getBlockTransactionCountByNumber';
		parameters: {(self hexa: aBlockNumber)};
		yourself
	
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGetCode: anAddress blockHash: aBlockHash [ 
	<doc:'Encodes a message entity for the RPC message eth_getCode'>
	^ FogMessage new
		method: 'eth_getCode';
		parameters:
			{anAddress.
			(self hexa: aBlockHash)};
		yourself
	
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGetCode: anAddress blockNumber: aBlockNumber [ 
	<doc:'Encodes a message entity for the RPC message eth_getCode'>
	^ FogMessage new
		method: 'eth_getCode';
		parameters:
			{anAddress.
			(self hexa: aBlockNumber)};
		yourself
	
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGetCode: anAddress blockTag: aBlockTag [ 
	<doc:'Encodes a message entity for the RPC message eth_getCode'>
	^ FogMessage new
		method: 'eth_getCode';
		parameters:
			{anAddress.
			aBlockTag};
		yourself
	
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGetCompilers [ 
	<doc:'Encodes a message entity for the RPC message eth_getCompilers'>
	^ FogMessage new
		method: 'eth_getCompilers';
		parameters: {};
		yourself
	
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGetFilterChanges: aFilterId [ 
	<doc:'Encodes a message entity for the RPC message eth_getFilterChanges'>
	^ FogMessage new
		method: 'eth_getFilterChanges';
		parameters: {(self hexa: aFilterId)};
		yourself
	
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGetFilterLogs: aFilterId [ 
	<doc:'Encodes a message entity for the RPC message eth_getFilterLogs'>
	^ FogMessage new
		method: 'eth_getFilterLogs';
		parameters: {(self hexa: aFilterId)};
		yourself
	
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGetLogs: aETHFilterDefinition [ 
	<doc:'Encodes a message entity for the RPC message eth_getLogs'>
	^ FogMessage new
		method: 'eth_getLogs';
		parameters: {aETHFilterDefinition};
		yourself
	
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGetStorageAt: anAddress upTo: anAmountOfBytes blockNumber: aBlockNumber [ 
	<doc:'Encodes a message entity for the RPC message eth_getStorageAt'>
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
	<doc:'Encodes a message entity for the RPC message eth_getStorageAt'>
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
	<doc:'Encodes a message entity for the RPC message eth_getTransactionByBlockHashAndIndex'>
	^ FogMessage new
		method: 'eth_getTransactionByBlockHashAndIndex';
		parameters:
			{aBlockHash.
			(self hexa: anIndex)};
		yourself
	
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGetTransactionByBlockNumber: aBlockNumber andIndex: anIndex [ 
	<doc:'Encodes a message entity for the RPC message eth_getTransactionByBlockNumberAndIndex'>
	^ FogMessage new
		method: 'eth_getTransactionByBlockNumberAndIndex';
		parameters:
			{(self hexa: aBlockNumber).
			(self hexa: anIndex)};
		yourself
	
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGetTransactionByBlockTag: aBlockTag andIndex: anIndex [ 
	<doc:'Encodes a message entity for the RPC message eth_getTransactionByBlockNumberAndIndex'>
	^ FogMessage new
		method: 'eth_getTransactionByBlockNumberAndIndex';
		parameters:
			{aBlockTag.
			(self hexa: anIndex)};
		yourself
	
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGetTransactionByHash: aTransactionHash [ 
	<doc:'Encodes a message entity for the RPC message eth_getTransactionByHash'>
	^ FogMessage new
		method: 'eth_getTransactionByHash';
		parameters: {aTransactionHash};
		yourself
	
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGetTransactionCount: anAccountAddress blockNumber: aBlockNumber [ 
	<doc:'Encodes a message entity for the RPC message eth_getTransactionCount'>
	^ FogMessage new
		method: 'eth_getTransactionCount';
		parameters:
			{anAccountAddress.
			(self hexa: aBlockNumber)};
		yourself
	
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGetTransactionCount: anAccountAddress blockTag: aBlockTag [ 
	<doc:'Encodes a message entity for the RPC message eth_getTransactionCount'>
	^ FogMessage new
		method: 'eth_getTransactionCount';
		parameters:
			{anAccountAddress.
			aBlockTag};
		yourself
	
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGetTransactionReceipt: aTransactionHash [ 
	<doc:'Encodes a message entity for the RPC message eth_getTransactionReceipt'>
	^ FogMessage new
		method: 'eth_getTransactionReceipt';
		parameters: {aTransactionHash};
		yourself
	
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGetUncleByBlockHash: aBlockHash andIndex: anIndex [ 
	<doc:'Encodes a message entity for the RPC message eth_getUncleByBlockHashAndIndex'>
	^ FogMessage new
		method: 'eth_getUncleByBlockHashAndIndex';
		parameters:
			{aBlockHash.
			(self hexa: anIndex)};
		yourself
	
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGetUncleByBlockNumber: aBlockNumber andIndex: anIndex [ 
	<doc:'Encodes a message entity for the RPC message eth_getUncleByBlockNumberAndIndex'>
	^ FogMessage new
		method: 'eth_getUncleByBlockNumberAndIndex';
		parameters:
			{(self hexa: aBlockNumber).
			(self hexa: anIndex)};
		yourself
	
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGetUncleByBlockTag: aBlockTag andIndex: anIndex [ 
	<doc:'Encodes a message entity for the RPC message eth_getUncleByBlockNumberAndIndex'>
	^ FogMessage new
		method: 'eth_getUncleByBlockNumberAndIndex';
		parameters:
			{aBlockTag.
			(self hexa: anIndex)};
		yourself
	
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGetUncleCountByBlockHash: aBlockHash [ 
	<doc:'Encodes a message entity for the RPC message eth_getUncleCountByBlockHash'>
	^ FogMessage new
		method: 'eth_getUncleCountByBlockHash';
		parameters: {aBlockHash};
		yourself
	
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageGetWork [ 
	<doc:'Encodes a message entity for the RPC message eth_getWork'>
	^ FogMessage new
		method: 'eth_getWork';
		parameters: {};
		yourself
	
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageHashrate [ 
	<doc:'Encodes a message entity for the RPC message eth_hashrate'>
	^ FogMessage new
		method: 'eth_hashrate';
		parameters: {};
		yourself
	
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageMining [  
	<doc:'Encodes a message entity for the RPC message eth_mining'>
	^ FogMessage new
		method: 'eth_mining';
		parameters: {};
		yourself
	
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageNewBlockFilter [  
	<doc:'Encodes a message entity for the RPC message eth_newBlockFilter'>
	^ FogMessage new
		method: 'eth_newBlockFilter';
		parameters: {};
		yourself
	
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageNewFilter: aETHFilterDefinition [  
	<doc:'Encodes a message entity for the RPC message eth_newFilter'>
	^ FogMessage new
		method: 'eth_newFilter';
		parameters: {aETHFilterDefinition};
		yourself
	
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageNewPendingTransactionFilter [  
	<doc:'Encodes a message entity for the RPC message eth_newPendingTransactionFilter'>
	^ FogMessage new
		method: 'eth_newPendingTransactionFilter';
		parameters: {};
		yourself
	
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageProtocolVersion [  
	<doc:'Encodes a message entity for the RPC message eth_protocolVersion'>
	^ FogMessage new
		method: 'eth_protocolVersion';
		parameters: {};
		yourself
	
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageSendRawTransaction: aCodeOrCall [  
	<doc:'Encodes a message entity for the RPC message eth_sendRawTransaction'>
	^ FogMessage new
		method: 'eth_sendRawTransaction';
		parameters: {aCodeOrCall};
		yourself
	
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageSendTransaction: aETHCallDefinition [  
	<doc:'Encodes a message entity for the RPC message eth_sendTransaction'>
	^ FogMessage new
		method: 'eth_sendTransaction';
		parameters: {aETHCallDefinition};
		yourself
	
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageSignWith: anAccount sha3Data: aDataSha [  
	<doc:'Encodes a message entity for the RPC message eth_sign'>
	^ FogMessage new
		method: 'eth_sign';
		parameters:
			{anAccount.
			aDataSha};
		yourself
	
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageSubmitHashrate: aHashRateIn32BytesHexa clientId: aClientUUID [    
	<doc:'Encodes a message entity for the RPC message eth_submitHashrate'>
	^ FogMessage new
		method: 'eth_submitHashrate';
		parameters:
			{aHashRateIn32BytesHexa.
			aClientUUID};
		yourself
	
	
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageSubmitWork: aCryptoNonce header: aBlockPoWHash digest: aDigest [    
	<doc:'Encodes a message entity for the RPC message eth_submitWork'>
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
	<doc:'Encodes a message entity for the RPC message eth_syncing'>
	^ FogMessage new
		method: 'eth_syncing';
		parameters: {};
		yourself
	
]

{ #category : #'as yet unclassified' }
FogEthereumAPI >> messageUninstallFilterID: aFilterId [  
	<doc:'Encodes a message entity for the RPC message eth_uninstallFilter'>
	^ FogMessage new
		method: 'eth_uninstallFilter';
		parameters: {(self hexa: aFilterId)};
		yourself
	
]
