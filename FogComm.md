# FogComm - Generated Doc
## Manifest
FogComm project defines the minimal library for accessing to GETH RPC Client. 
Based on the JSON-RPC Specification: 
	https://github.com/ethereum/wiki/wiki/JSON-RPC

## Project Examples
```smalltalk
exampleCreateCustomConnection
	| custom |
	custom := FogConnection on: 'http://localhost:8545'
```
```smalltalk
exampleCreateDefaultConnection
	| default |
	default :=FogConnection createDefaultConnection
```
```smalltalk
exampleAccessBlock
	| connection |
	connection := FogConnection createDefaultConnection.
	^ connection eth getBlockByTag: #latest full: true.
```
```smalltalk
exampleAccessTransaction
	| connection |
	connection := FogConnection createDefaultConnection.
	^ connection eth getTransactionByHash: '0x576a713667837f7375643c5a5cdc93d5ca7ba15cf96eebc27a523c42debe436e'
```
```smalltalk
exampleAccessContract
	| connection |
	connection := FogConnection createDefaultConnection.
	^ connection eth getContractCode: '0xcc70db1ac810677c06d9cc1cdd8c953b12edd3fa' blockTag: #latest
```


## FogConnection
Connection. It stores the number of request. It has the responsibilite of connecting the RPC server (rest) and managing base communication, asi deconding enconding 

### Properties
url
json
requestId
eth
service

### Methods
#### FogConnection>>call: aFogMessage
Encodes a FogMessage and send it to an GETH RPC end point

#### FogConnection>>web3
Get an API Access object. responsible to resolve the web3_ kind of messages (more in FogWeb3)

#### FogConnection>>net
Get an API Access object. responsible to resolve the net_ kind of messages (more in FogNet)

#### FogConnection>>url: anUndefinedObject 
Set up the URL to GETH RPC endpoint

#### FogConnection>>eth
Get an API Access object. responsible to resolve the eth_ kind of messages (more in FogEth)

#### FogConnection>>decode: aString
Decodes a message according to the JSON based GETH protocol definition

#### FogConnection>>encode: aETHMessage
Encodes a message according to the JSON based GETH protocol definition



## FogEth
FogEthereumAPI  relative 

### Methods
#### FogEth>>compileSolidity: sourceCode
Returns compiled solidity code.

#### FogEth>>getUncleByBlockHash: var1 andIndex: var2
Returns information about a uncle of a block by hash and uncle index position.

#### FogEth>>uninstallFilterID: var1
Uninstalls a filter with given id. Should always be called when watch is no longer needed. Additonally Filters timeout when they aren"t requested with <a href="#eth_getfilterchanges">eth_getFilterChanges</a> for a period of time.

#### FogEth>>sendRawTransaction: var1
Creates new message call transaction or a contract creation for signed transactions.

#### FogEth>>getBlockTransactionCountByHash: var1
Returns the number of transactions in a block from a block matching the given block hash.

#### FogEth>>mining
Returns <code>true</code> if client is actively mining new blocks.

#### FogEth>>estimateGas: var1
Generates and returns an estimate of how much gas is necessary to allow the transaction to complete. The transaction will not be added to the blockchain. Note that the estimate may be significantly more than the amount of gas actually used by the transaction, for a variety of reasons including EVM mechanics and node performance.

#### FogEth>>getUncleByBlockNumber: var1 andIndex: var2
Returns information about a uncle of a block by number and uncle index position.

#### FogEth>>getBalance: var1 blockNumber: var2
Returns the balance of the account of given address.

#### FogEth>>call: anETHCallDefinition block: aString
Executes a new message call immediately without creating a transaction on the block chain.

#### FogEth>>getStorageAt: var1 upTo: var2 blockTag: var3
Returns the value from a storage position at a given address.

#### FogEth>>getTransactionByHash: aTxHash
Returns the information about a transaction requested by transaction hash.

#### FogEth>>sendTransaction: var1
Creates new message call transaction or a contract creation, if the data field contains code.

#### FogEth>>signWith: var1 sha3Data: var2
The sign method calculates an Ethereum specific signature with: <code>sign(keccak256("\x19Ethereum Signed Message:\n" + len(message) + message)))</code>.

#### FogEth>>getFilterChanges: var1
Polling method for a filter, which returns an array of logs which occurred since last poll.

#### FogEth>>getBlockByNumber: aBlockNumber full: aBoolean
Returns information about a block by block number.

#### FogEth>>newBlockFilter
Creates a filter in the node, to notify when a new block arrives. To check if the state has changed, call <a href="#eth_getfilterchanges">eth_getFilterChanges</a>.

#### FogEth>>getTransactionByBlockTag: aBlockTag andIndex: anIndex
Returns information about a transaction by block number and transaction index position.

#### FogEth>>gasPrice
Returns the current price per gas in wei.

#### FogEth>>getUncleByBlockTag: var1 andIndex: var2
Returns information about a uncle of a block by number and uncle index position.

#### FogEth>>getStorageAt: var1 upTo: var2 blockNumber: var3
Returns the value from a storage position at a given address.

#### FogEth>>getBlockTransactionCountByNumber: var1
Returns the number of transactions in a block matching the given block number.

#### FogEth>>getTransactionCount: var1 blockNumber: var2
Returns the number of transactions <em>sent</em> from an address.

#### FogEth>>coinBase
Returns the client coinbase address.

#### FogEth>>submitHashrate: var1 clientId: var2
Used for submitting mining hashrate.

#### FogEth>>newFilter: var1
Creates a filter object, based on filter options, to notify when the state changes (logs). To check if the state has changed, call <a href="#eth_getfilterchanges">eth_getFilterChanges</a>.

#### FogEth>>getTransactionByBlockNumber: aBlockNumber andIndex: anIndex
Returns information about a transaction by block number and transaction index position.

#### FogEth>>getBalance: var1 blockTag: var2
Returns the balance of the account of given address.

#### FogEth>>getUncleCountByBlockHash: var1
Returns the number of uncles in a block from a block matching the given block hash.

#### FogEth>>getFilterLogs: var1
Returns an array of all logs matching filter with given id.

#### FogEth>>compileLLL: var1
Returns compiled LLL code.

#### FogEth>>getTransactionCount: var1 blockTag: var2
Returns the number of transactions <em>sent</em> from an address.

#### FogEth>>submitWork: var1 header: var2 digest: var3
Used for submitting a proof-of-work solution.

#### FogEth>>newPendingTransactionFilter
Creates a filter in the node, to notify when new pending transactions arrive. To check if the state has changed, call <a ref="#eth_getfilterchanges">eth_getFilterChanges</a>.

#### FogEth>>accounts
Returns a list of addresses owned by client.

#### FogEth>>call: var1
Executes a new message call immediately without creating a transaction on the block chain.

#### FogEth>>getCompilers
Returns a list of available compilers in the client.

#### FogEth>>getWork
Returns the hash of the current block, the seedHash, and the boundary condition to be met ("target").

#### FogEth>>getBlockByHash: aBlockHash full: aBoolean
Returns information about a block by hash.

#### FogEth>>getBlockByTag: aTag full: aBoolean
Returns information about a block by block number.

#### FogEth>>compileSerpent: var1
Returns compiled serpent code.

#### FogEth>>getTransactionByBlockHash: aBlockHash andIndex: aTxIndex
Returns information about a transaction by block hash and transaction index position.

#### FogEth>>getTransactionReceipt: var1
Returns the receipt of a transaction by transaction hash.

#### FogEth>>syncing
Returns an object with data about the sync status or <code>false</code>.

#### FogEth>>blockNumber
Returns the number of most recent block.

#### FogEth>>protocolVersion
Returns the current ethereum protocol version.

#### FogEth>>getLogs: var1
Returns an array of all logs matching a given filter object.

#### FogEth>>hashrate
Returns the number of hashes per second that the node is mining with.



## FogEthereumAPI
Ethereum subset of RPC Calls 


### Methods
#### FogEthereumAPI>>messageSignWith: anAccount sha3Data: aDataSha  
Encodes a message entity for the RPC message eth_sign

#### FogEthereumAPI>>messageCompileSolidity: aSourceCodeString 
Encodes a message entity for the RPC message eth_compileSolidity

#### FogEthereumAPI>>messageGetUncleByBlockHash: aBlockHash andIndex: anIndex 
Encodes a message entity for the RPC message eth_getUncleByBlockHashAndIndex

#### FogEthereumAPI>>messageGetLogs: aETHFilterDefinition 
Encodes a message entity for the RPC message eth_getLogs

#### FogEthereumAPI>>messageCoinBase 
Encodes a message entity for the RPC message eth_coinbase

#### FogEthereumAPI>>messageGetTransactionCount: anAccountAddress blockNumber: aBlockNumber 
Encodes a message entity for the RPC message eth_getTransactionCount

#### FogEthereumAPI>>messageBlockNumber 
Encodes a message entity for the RPC message eth_blockNumber

#### FogEthereumAPI>>messageProtocolVersion  
Encodes a message entity for the RPC message eth_protocolVersion

#### FogEthereumAPI>>messageGetBlockByTag: aTag full: aBoolean 
Encodes a message entity for the RPC message eth_getBlockByNumber

#### FogEthereumAPI>>messageGetTransactionByBlockHash: aBlockHash andIndex: anIndex 
Encodes a message entity for the RPC message eth_getTransactionByBlockHashAndIndex

#### FogEthereumAPI>>messageGetBlockByNumber: aBlockNumber full: aBoolean 
Encodes a message entity for the RPC message eth_getBlockByNumber

#### FogEthereumAPI>>messageGetStorageAt: anAddress upTo: anAmountOfBytes blockTag: aBlockTag 
Encodes a message entity for the RPC message eth_getStorageAt

#### FogEthereumAPI>>messageNewBlockFilter  
Encodes a message entity for the RPC message eth_newBlockFilter

#### FogEthereumAPI>>messageUninstallFilterID: aFilterId  
Encodes a message entity for the RPC message eth_uninstallFilter

#### FogEthereumAPI>>messageGetBalance: anAccountHash blockNumber: anInteger 
Encodes a message entity for the RPC message eth_getBalance

#### FogEthereumAPI>>messageGetWork 
Encodes a message entity for the RPC message eth_getWork

#### FogEthereumAPI>>messageGetCode: anAddress blockTag: aBlockTag 
Encodes a message entity for the RPC message eth_getCode

#### FogEthereumAPI>>messageSubmitHashrate: aHashRateIn32BytesHexa clientId: aClientUUID    
Encodes a message entity for the RPC message eth_submitHashrate

#### FogEthereumAPI>>messageEstimateGas: aETHCallDefinition 
Encodes a message entity for the RPC message eth_estimateGas

#### FogEthereumAPI>>messageGetUncleByBlockNumber: aBlockNumber andIndex: anIndex 
Encodes a message entity for the RPC message eth_getUncleByBlockNumberAndIndex

#### FogEthereumAPI>>messageGetBlockTransactionCountByHash: aBlockHashID 
Encodes a message entity for the RPC message eth_getBlockTransactionCountByHash

#### FogEthereumAPI>>messageCompileLLL: aLLLSourceCodeString 
Encodes a message entity for the RPC message eth_compileLLL

#### FogEthereumAPI>>messageGetTransactionCount: anAccountAddress blockTag: aBlockTag 
Encodes a message entity for the RPC message eth_getTransactionCount

#### FogEthereumAPI>>messageGetBalance: anAccountHash blockTag: aBlockTag 
Encodes a message entity for the RPC message eth_getBalance

#### FogEthereumAPI>>messageCall: aETHCallDefinition 
Encodes a message entity for the RPC message eth_call

#### FogEthereumAPI>>messageSendRawTransaction: aCodeOrCall  
Encodes a message entity for the RPC message eth_sendRawTransaction

#### FogEthereumAPI>>messageNewFilter: aETHFilterDefinition  
Encodes a message entity for the RPC message eth_newFilter

#### FogEthereumAPI>>hexa: aNumber 
Encodes a message entity for the RPC message 

#### FogEthereumAPI>>messageAccounts 
Encodes a message entity for the RPC message eth_accounts

#### FogEthereumAPI>>messageGetBlockTransactionCountByNumber: aBlockNumber 
Encodes a message entity for the RPC message eth_getBlockTransactionCountByNumber

#### FogEthereumAPI>>messageHashrate 
Encodes a message entity for the RPC message eth_hashrate

#### FogEthereumAPI>>messageSubmitWork: aCryptoNonce header: aBlockPoWHash digest: aDigest    
Encodes a message entity for the RPC message eth_submitWork

#### FogEthereumAPI>>messageGasPrice 
Encodes a message entity for the RPC message eth_gasPrice

#### FogEthereumAPI>>messageGetUncleByBlockTag: aBlockTag andIndex: anIndex 
Encodes a message entity for the RPC message eth_getUncleByBlockNumberAndIndex

#### FogEthereumAPI>>messageGetCode: anAddress blockNumber: aBlockNumber 
Encodes a message entity for the RPC message eth_getCode

#### FogEthereumAPI>>messageGetFilterChanges: aFilterId 
Encodes a message entity for the RPC message eth_getFilterChanges

#### FogEthereumAPI>>messageCompileSerpent: aSourceCodeString 
Encodes a message entity for the RPC message eth_compileSerpent

#### FogEthereumAPI>>messageGetTransactionReceipt: aTransactionHash 
Encodes a message entity for the RPC message eth_getTransactionReceipt

#### FogEthereumAPI>>messageGetTransactionByBlockNumber: aBlockNumber andIndex: anIndex 
Encodes a message entity for the RPC message eth_getTransactionByBlockNumberAndIndex

#### FogEthereumAPI>>messageGetCompilers 
Encodes a message entity for the RPC message eth_getCompilers

#### FogEthereumAPI>>messageCall: aETHCallDefinition block: blockRef 
Encodes a message entity for the RPC message eth_call

#### FogEthereumAPI>>messageGetTransactionByHash: aTransactionHash 
Encodes a message entity for the RPC message eth_getTransactionByHash

#### FogEthereumAPI>>messageSendTransaction: aETHCallDefinition  
Encodes a message entity for the RPC message eth_sendTransaction

#### FogEthereumAPI>>messageGetStorageAt: anAddress upTo: anAmountOfBytes blockNumber: aBlockNumber 
Encodes a message entity for the RPC message eth_getStorageAt

#### FogEthereumAPI>>messageNewPendingTransactionFilter  
Encodes a message entity for the RPC message eth_newPendingTransactionFilter

#### FogEthereumAPI>>messageGetFilterLogs: aFilterId 
Encodes a message entity for the RPC message eth_getFilterLogs

#### FogEthereumAPI>>messageMining  
Encodes a message entity for the RPC message eth_mining

#### FogEthereumAPI>>messageGetTransactionByBlockTag: aBlockTag andIndex: anIndex 
Encodes a message entity for the RPC message eth_getTransactionByBlockNumberAndIndex

#### FogEthereumAPI>>messageSyncing  
Encodes a message entity for the RPC message eth_syncing

#### FogEthereumAPI>>messageGetUncleCountByBlockHash: aBlockHash 
Encodes a message entity for the RPC message eth_getUncleCountByBlockHash

#### FogEthereumAPI>>messageGetBlockByHash: aBlockHashID full: aBoolean 
Encodes a message entity for the RPC message eth_getBlockByHash



## FogNet
FogNetAPI relative 

### Methods
#### FogNet>>listening
Returns <code>true</code> if client is actively listening for network connections.

#### FogNet>>version
Returns the current network id.



## FogNetAPI
Net subset of callable RPC messages 


### Methods
#### FogNetAPI>>messageNetVersion   
Encodes a message entity for the RPC message net_version

#### FogNetAPI>>messageNetListening 
Encodes a message entity for the RPC message net_listening



## FogWeb3
FogWeb3API relative 

### Methods
#### FogWeb3>>clientVersion
Returns the current client version.

#### FogWeb3>>sha3_256: aString
Returns Keccak-256. Resolved locally, using Keccak project.

#### FogWeb3>>sha3: aString
Returns Keccak-256 (<em>not</em> the standardized SHA3-256) of the given data.



## FogWeb3API
Web3 subset of callable RPC messages 


### Methods
#### FogWeb3API>>messageClientVersion 
Encodes a message entity for the RPC message web3_clientVersion

#### FogWeb3API>>messageSha3: aString   
Encodes a message entity for the RPC message web3_sha3



