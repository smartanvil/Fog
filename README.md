# Fog



Pharo Ethereum Driver 

Fog is a library that allows the user to connect to an ethereum based blockchain data base. 

Is based on the Javascript canonical implementation done by Ethereum community [Ethereum Javascript API](https://github.com/ethereum/wiki/wiki/JavaScript-API).


## Dependencies 

``` 
### Solidity
``` 
 npm install solc
``` 

## Download code

### Iceberg / Baseline 

```
Metacello
	new
	baseline: 'Fog';
	repository: 'github://sbragagnolo/Fog/src';
	load.
```

### By hand 
You may want to use this version for having access to some scripts and contracts samples. 
```
git checkout git@github.com:sbragagnolo/Fog.git
```
```
Metacello
	new
	baseline: 'Fog';
	repository: 'filetree:///path/to/git-repository/Fog/src';;
	load.
```

## Fog's philosophy

  The general Fog's philosophy, is influenced mainly by the Smalltalk and Pharo philosophies: 
  
 	* Modular 
	* Object
   


  First of all we have to set up some needs of the library for being fully functional. 
  
### Connection
  You may want to configure the connection.
  This library so far uses a singleton for access to the connection to the database. 
  The default connection will be pointing, as in the shown example, to the default port, at localhost.
 ```
  FogConnection currentOn: 'http://localhost:8545'.  
 ```
  
### Cache
  Fog has a cache system, to avoid access many times to the same remote object. 
  There is not yet an automatic way for vacuum this objects. For this propose, you may want to clean up this cache by executing 
```
  FogCache reset
```

### Known contracts
  For trying to interpret the content of the blockchain contracts, we use a pool of available contracts. An other singleton. 
  In the very beginning this pool will be empty. You will probable want to load your own contracts in order to be able to navigate your data.
  
```
  FogFileContractDescription 	loadKnownContracts: FileLocator contractsFolder
```
  Contract's folder method will look up for any folder named contracts in between the image folder and root folder. 
  You can use any file reference as parameter for this method. 

### Monitor service 
  Finally you need to startup the Monitor service. 
  This service will monitorize any transaction started by the user of the library up to the moment when this transaction is fully executed. 
  
```
  FogTransactionMonitorService reset; current. 
```


Once done the setup of your image, you can start using the library. 

## Navigating the database

   The Ethereum database plays with the abstractions of:
   
   * Block
   * Transaction
   * Accounts
      - Real accounts
      - Deployed contract instances 
   
   The library gives us access to all this information as reifyied objects. Each of these objects has a GTTool inspection extension, focusing on the navigability and in the main data of each object.
   
### Fetching a block, and inspecting from the block 
    
 The block is the time related abstraction in blockchain systems. [Glossary - Block](http://ethdocs.org/en/latest/glossary.html?highlight=block) Inside of it, we can find a father, the included transactions, and the timestamp, inbetween other less remarkable pieces of information. 
    
    
```
 block := FogConnection currentConnection eth getBlockByTag: 'latest' full: true.
```
 This piece of code gives us the last processed block. 
 We can use this block as entry point for navigating to the previous blocks by asking for the parent block
 
```
  block := block parent
```
 As well in ethereum we have the concept of uncle blocks, for blocks that were processed at the same time as the parent block [Glossary - Uncle](http://ethdocs.org/en/latest/glossary.html?highlight=uncle)
 
```
  uncles := block uncles. 
```

Finally, from the block object, we can also navigate to transaction objects [Glossary - Transaction](http://ethdocs.org/en/latest/glossary.html?highlight=transaction). 

```
  transactions := block transactions.
```



### Fetching a transaction and inspecting from the transaction

   A transaction is an change operated into the blockchain distributed ledger. It is included inside a block. It relates accounts with modifications. This modifications may be money transference or code execution. 
   For accessing a transaction, you can do it from the block, as we saw in the 'From the block' navigation part. But we also can fetch an specific transaction, pointing it by hash 
   
```
  transaction := FogConnection currentConnection eth getTransactionByHash: 'hash'.
```
 
 From a transaction we can access to the owning block

```
   ownerBlock := transaction block. 
```
  
 And also to the related accounts 
```
   to := transaction to. 
   from := transaction from. 
```
 This accounts may be [external or internal accounts](http://ethdocs.org/en/latest/glossary.html?highlight=account)

### Fetching a deployed contract

   Finally, deployed contracts have a particular interest, since is one of the most important functionalities of the Ethereum flavor. 
```
  instance := FogConnection eth  getContract: 'ContractHash'  blockNumber: 124312  
```
   This code will bring the contract instance binded to the state it had at the given block number. As well you can use tags instead of numbers
   
```
  instance := FogConnection eth  getContract: 'ContractHash'  blockTag: 'latest'  
```
  If the contract source code was loaded as a known contract (check in the configuration section), the contract instance will be browsable with GTTools, and it will provide a mirror for interacting with it (check the contract section) 
  
   
## Contracts

  Finally we have the contracts. Contracts are probably the reason for using Ethereum. 
  A deployed contract, in the end, is like a deployed object that is interacted by sending messages, that are executed in transactional fashion, or function, depending on if they do or do not state changes.
  
  So far our implementation does not have a real reification of the contract instance, since it should be based on a session concept, that we do not have yet. Then the current proposed usage is based on the generated reflective system. 
### Create an account
  For interacting with contracts you will need to have an account. For the database side you may want to check out the documentation [Account management](http://ethdocs.org/en/latest/account-management.html). 
  
  By the side of Pharo you will need to create an account object with it related hash ID. 
  
```
    account := FogExternalAccount new
		hash: self ownerAccountAddress ;
		name: 'My Account';
		yourself
```

### Deploy a contract using reflection

First we need to access what we call the Contract description. This object relates the source code with it AST, binary and deployable representations. 

```
 contractDescription := FogFileContractDescription fromFile: 'path/to/contract'
```
The contract description object respond to the #mirror message. Giving as return a FogContractMirror. This mirror is the representation of the Contract class side. Exposes the constructor method.

```
   constructor := contractDescription mirror constructor.
```
This constructor method is as well a mirror of the contructing method, and it allows to execute the remote method by sending the proper message to the object.
Before showing how to do it, we may need to explain the configuration association array: 
Ethereum method activation ask for execution metadata. As the ammount of gas the gas price, and the account you are using for activating this method (The one that will be charged with the execution price). 
For this meta data we use an array of associations. 

```
  configuration := 
  {(#from -> account address).
	(#gas -> 3000000).
	(#gasPrice -> 60)}.
  
	contractInstance := constructor applyOn: contractDescription valueWithArguments: {} configuration: configuration
```
  The contractInstance variable, now points to a deployed contract instance, of the class FogContractInstanceBind. 
  This contract instance it may not be ready, since the transaction will be reduced when the new proof of work is solved. 
  
  For being sure that this object is ready to use, you may want to send the message #waitIsReady to it. It will force a synchronisation. Disclaimer: this may take some minutes. 
  

### Activate methods by reflection 
  
  Once we have a usable FogContractInstanceBind object, we can use it for activatig remote method activations. 
  But first, we have to get the contract instance mirror, to being able to lookup for the contract instance available methods. 
  
```
  instanceMirror := contractDescription mirror instanceMirror. 
  instanceMirror methods inspect 
```
  
  For looking up for a method, you can use the related selector. The generated selector for each method is
  
  * No arguments selector uses the name of the function
  * One argument selector uses the name of the function plus $: character. 
  * N > 1 argument selector uses the name of the function plus $: character and adds #and: for each extra parameter. 
  
```
  getMethod := instanceMirror method: #get. 
  setMethod := instanceMirror method: #set:. 
  twoParamsMethod: instanceMirror method: #method:and:
```
  
  Finally with the method and the bind object at hand we can activate it by sending a similar message as the one we used to the constructor. Depending on the kind of message, if it changes or no state the kind of return of the activation may be different
  
  The following case shows a getter. It should not mean any change of state. So the return is a regular value. 
```
  configuration := 
  {(#from -> account address).
	(#gas -> 3000000).
	(#gasPrice -> 60)}.
  
  directReturn := getMethod applyOn: contractInstance valueWithArguments: {} configuration: configuration.
```

  The following case illustrates a setter. It means of course a change of state. Then the return will be a transaction receipt hash. 
  
```
  configuration := 
  {(#from -> account address).
	(#gas -> 3000000).
	(#gasPrice -> 60)}.
  
  receiptHash := setMethod applyOn: contractInstance valueWithArguments: { #Value } configuration: configuration.
```
 This receipt hash may be used for synchronizing or checking the remote state of the execution by the user if needed by using the transaction monitor, whom will provide us a future to deal with this execution. 
 
```
  future := FogTransactionMonitorService current receiptFor: receiptHash. 
```
 The future is a TaskIt Future. You can learn more about futures on the [TaskIt project documentation](https://github.com/sbragagnolo/taskit).

Quick some of the things we can do with a future is to force a synchronization:
```
	future synchronizeTimeout: 10 minutes.
```

Or to register some callbacks 
```
	future onSuccessDo:[: transactionReceipt | #doSomething ]; onFailureDo:[:error | #doSomething ].##
```


### Access properties by reflection 
 
  The same way we can access on the methods of a Contract instance mirror by sending #method: message we can do get specific property mirrors by sending the #property: message.
  
```
   property := instanceMirror property: #variableName.
```
  This property mirror allow us to have read access to remote variables even if they do not have any getter. For accessing it value, just execute: 

```
  value := property value: contractInstance. 
```
  So far we do support any kind of simple type and structs. We do not yet support arrays (strings neither) or dictionaries. 
  


## Misc

 For testing the usage, the checked out project provides a script called dev.sh, at the script folder. This script executes the client with some accounts already created, and in a isolated network, with a single miner. 
  
 You will need to run some time this client for having enough ether for being able to deploy and execute contracts. And you will need to check the account hash of your related miner. 
  
 For the rest of the methods implemented on the connection you can use the ehereum javascript api, since they are the same .
  
# FogComm - Generated Doc
## Manifest
FogComm project defines the minimal library for accessing to GETH RPC Client. 
Based on the JSON-RPC Specification: 
	https://github.com/ethereum/wiki/wiki/JSON-RPC

## Project Examples

```smalltalk
exampleCreateDefaulConnection
	| default |
	default :=FogConnection createDefaultConnection
```
```smalltalk
exampleAccessTransaction
	| connection |
	connection := FogConnection createDefaultConnection.
	^ connection eth getTransactionByHash: '0x576a713667837f7375643c5a5cdc93d5ca7ba15cf96eebc27a523c42debe436e'
```
```smalltalk
exampleCreateCustomConnection
	| custom |
	custom := FogConnection on: 'http://localhost:8545'
```
```smalltalk
exampleAccessBlock
	| connection |
	connection := FogConnection createDefaultConnection.
	^ connection eth getBlockByTag: #latest full: true.
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
#### FogConnection>>encode: aETHMessage
Encodes a message according to the JSON based GETH protocol definition

#### FogConnection>>net
Get an API Access object. responsible to resolve the net_ kind of messages (more in FogNet)

#### FogConnection>>call: aFogMessage
Encodes a FogMessage and send it to an GETH RPC end point

#### FogConnection>>web3
Get an API Access object. responsible to resolve the web3_ kind of messages (more in FogWeb3)

#### FogConnection>>decode: aString
Decodes a message according to the JSON based GETH protocol definition

#### FogConnection>>url: anUndefinedObject 
Set up the URL to GETH RPC endpoint

#### FogConnection>>eth
Get an API Access object. responsible to resolve the eth_ kind of messages (more in FogEth)



## FogEth
FogEthereumAPI  relative 

### Methods
#### FogEth>>getUncleByBlockTag: var1 andIndex: var2
Returns information about a uncle of a block by number and uncle index position.

#### FogEth>>getBlockTransactionCountByHash: var1
Returns the number of transactions in a block from a block matching the given block hash.

#### FogEth>>estimateGas: var1
Generates and returns an estimate of how much gas is necessary to allow the transaction to complete. The transaction will not be added to the blockchain. Note that the estimate may be significantly more than the amount of gas actually used by the transaction, for a variety of reasons including EVM mechanics and node performance.

#### FogEth>>sendRawTransaction: var1
Creates new message call transaction or a contract creation for signed transactions.

#### FogEth>>accounts
Returns a list of addresses owned by client.

#### FogEth>>compileSolidity: sourceCode
Returns compiled solidity code.

#### FogEth>>getBlockTransactionCountByNumber: var1
Returns the number of transactions in a block matching the given block number.

#### FogEth>>getTransactionByBlockTag: aBlockTag andIndex: anIndex
Returns information about a transaction by block number and transaction index position.

#### FogEth>>sendTransaction: var1
Creates new message call transaction or a contract creation, if the data field contains code.

#### FogEth>>newBlockFilter
Creates a filter in the node, to notify when a new block arrives. To check if the state has changed, call <a href="#eth_getfilterchanges">eth_getFilterChanges</a>.

#### FogEth>>getCompilers
Returns a list of available compilers in the client.

#### FogEth>>getBalance: var1 blockTag: var2
Returns the balance of the account of given address.

#### FogEth>>mining
Returns <code>true</code> if client is actively mining new blocks.

#### FogEth>>getLogs: var1
Returns an array of all logs matching a given filter object.

#### FogEth>>signWith: var1 sha3Data: var2
The sign method calculates an Ethereum specific signature with: <code>sign(keccak256("\x19Ethereum Signed Message:\n" + len(message) + message)))</code>.

#### FogEth>>getTransactionCount: var1 blockTag: var2
Returns the number of transactions <em>sent</em> from an address.

#### FogEth>>getBlockByHash: aBlockHash full: aBoolean
Returns information about a block by hash.

#### FogEth>>getUncleCountByBlockHash: var1
Returns the number of uncles in a block from a block matching the given block hash.

#### FogEth>>submitWork: var1 header: var2 digest: var3
Used for submitting a proof-of-work solution.

#### FogEth>>hashrate
Returns the number of hashes per second that the node is mining with.

#### FogEth>>protocolVersion
Returns the current ethereum protocol version.

#### FogEth>>getUncleByBlockHash: var1 andIndex: var2
Returns information about a uncle of a block by hash and uncle index position.

#### FogEth>>call: anETHCallDefinition block: aString
Executes a new message call immediately without creating a transaction on the block chain.

#### FogEth>>getTransactionByHash: aTxHash
Returns the information about a transaction requested by transaction hash.

#### FogEth>>newPendingTransactionFilter
Creates a filter in the node, to notify when new pending transactions arrive. To check if the state has changed, call <a ref="#eth_getfilterchanges">eth_getFilterChanges</a>.

#### FogEth>>blockNumber
Returns the number of most recent block.

#### FogEth>>gasPrice
Returns the current price per gas in wei.

#### FogEth>>getFilterChanges: var1
Polling method for a filter, which returns an array of logs which occurred since last poll.

#### FogEth>>getTransactionCount: var1 blockNumber: var2
Returns the number of transactions <em>sent</em> from an address.

#### FogEth>>getStorageAt: var1 upTo: var2 blockTag: var3
Returns the value from a storage position at a given address.

#### FogEth>>getTransactionByBlockNumber: aBlockNumber andIndex: anIndex
Returns information about a transaction by block number and transaction index position.

#### FogEth>>uninstallFilterID: var1
Uninstalls a filter with given id. Should always be called when watch is no longer needed. Additonally Filters timeout when they aren"t requested with <a href="#eth_getfilterchanges">eth_getFilterChanges</a> for a period of time.

#### FogEth>>getBalance: var1 blockNumber: var2
Returns the balance of the account of given address.

#### FogEth>>submitHashrate: var1 clientId: var2
Used for submitting mining hashrate.

#### FogEth>>compileSerpent: var1
Returns compiled serpent code.

#### FogEth>>syncing
Returns an object with data about the sync status or <code>false</code>.

#### FogEth>>getUncleByBlockNumber: var1 andIndex: var2
Returns information about a uncle of a block by number and uncle index position.

#### FogEth>>getStorageAt: var1 upTo: var2 blockNumber: var3
Returns the value from a storage position at a given address.

#### FogEth>>coinBase
Returns the client coinbase address.

#### FogEth>>getBlockByNumber: aBlockNumber full: aBoolean
Returns information about a block by block number.

#### FogEth>>call: var1
Executes a new message call immediately without creating a transaction on the block chain.

#### FogEth>>getFilterLogs: var1
Returns an array of all logs matching filter with given id.

#### FogEth>>getBlockByTag: aTag full: aBoolean
Returns information about a block by block number.

#### FogEth>>getTransactionReceipt: var1
Returns the receipt of a transaction by transaction hash.

#### FogEth>>newFilter: var1
Creates a filter object, based on filter options, to notify when the state changes (logs). To check if the state has changed, call <a href="#eth_getfilterchanges">eth_getFilterChanges</a>.

#### FogEth>>getWork
Returns the hash of the current block, the seedHash, and the boundary condition to be met ("target").

#### FogEth>>compileLLL: var1
Returns compiled LLL code.

#### FogEth>>getTransactionByBlockHash: aBlockHash andIndex: aTxIndex
Returns information about a transaction by block hash and transaction index position.



## FogEthereumAPI
Ethereum subset of RPC Calls 


### Methods
#### FogEthereumAPI>>messageSubmitHashrate: aHashRateIn32BytesHexa clientId: aClientUUID    
Encodes a message entity for the RPC message eth_submitHashrate

#### FogEthereumAPI>>messageSubmitWork: aCryptoNonce header: aBlockPoWHash digest: aDigest    
Encodes a message entity for the RPC message eth_submitWork

#### FogEthereumAPI>>hexa: aNumber 
Encodes a message entity for the RPC message 

#### FogEthereumAPI>>messageGetStorageAt: anAddress upTo: anAmountOfBytes blockTag: aBlockTag 
Encodes a message entity for the RPC message eth_getStorageAt

#### FogEthereumAPI>>messageGetBalance: anAccountHash blockTag: aBlockTag 
Encodes a message entity for the RPC message eth_getBalance

#### FogEthereumAPI>>messageCompileSolidity: aSourceCodeString 
Encodes a message entity for the RPC message eth_compileSolidity

#### FogEthereumAPI>>messageGetBlockByHash: aBlockHashID full: aBoolean 
Encodes a message entity for the RPC message eth_getBlockByHash

#### FogEthereumAPI>>messageCoinBase 
Encodes a message entity for the RPC message eth_coinbase

#### FogEthereumAPI>>messageBlockNumber 
Encodes a message entity for the RPC message eth_blockNumber

#### FogEthereumAPI>>messageAccounts 
Encodes a message entity for the RPC message eth_accounts

#### FogEthereumAPI>>messageCompileLLL: aLLLSourceCodeString 
Encodes a message entity for the RPC message eth_compileLLL

#### FogEthereumAPI>>messageGetTransactionByBlockTag: aBlockTag andIndex: anIndex 
Encodes a message entity for the RPC message eth_getTransactionByBlockNumberAndIndex

#### FogEthereumAPI>>messageGetUncleCountByBlockHash: aBlockHash 
Encodes a message entity for the RPC message eth_getUncleCountByBlockHash

#### FogEthereumAPI>>messageNewPendingTransactionFilter  
Encodes a message entity for the RPC message eth_newPendingTransactionFilter

#### FogEthereumAPI>>messageGetTransactionByHash: aTransactionHash 
Encodes a message entity for the RPC message eth_getTransactionByHash

#### FogEthereumAPI>>messageGetTransactionReceipt: aTransactionHash 
Encodes a message entity for the RPC message eth_getTransactionReceipt

#### FogEthereumAPI>>messageGetWork 
Encodes a message entity for the RPC message eth_getWork

#### FogEthereumAPI>>messageGetUncleByBlockHash: aBlockHash andIndex: anIndex 
Encodes a message entity for the RPC message eth_getUncleByBlockHashAndIndex

#### FogEthereumAPI>>messageSignWith: anAccount sha3Data: aDataSha  
Encodes a message entity for the RPC message eth_sign

#### FogEthereumAPI>>messageGetLogs: aETHFilterDefinition 
Encodes a message entity for the RPC message eth_getLogs

#### FogEthereumAPI>>messageMining  
Encodes a message entity for the RPC message eth_mining

#### FogEthereumAPI>>messageGetBlockTransactionCountByHash: aBlockHashID 
Encodes a message entity for the RPC message eth_getBlockTransactionCountByHash

#### FogEthereumAPI>>messageGetCode: anAddress blockTag: aBlockTag 
Encodes a message entity for the RPC message eth_getCode

#### FogEthereumAPI>>messageGetTransactionCount: anAccountAddress blockTag: aBlockTag 
Encodes a message entity for the RPC message eth_getTransactionCount

#### FogEthereumAPI>>messageGetFilterChanges: aFilterId 
Encodes a message entity for the RPC message eth_getFilterChanges

#### FogEthereumAPI>>messageGetUncleByBlockNumber: aBlockNumber andIndex: anIndex 
Encodes a message entity for the RPC message eth_getUncleByBlockNumberAndIndex

#### FogEthereumAPI>>messageGetBlockTransactionCountByNumber: aBlockNumber 
Encodes a message entity for the RPC message eth_getBlockTransactionCountByNumber

#### FogEthereumAPI>>messageEstimateGas: aETHCallDefinition 
Encodes a message entity for the RPC message eth_estimateGas

#### FogEthereumAPI>>messageGasPrice 
Encodes a message entity for the RPC message eth_gasPrice

#### FogEthereumAPI>>messageGetStorageAt: anAddress upTo: anAmountOfBytes blockNumber: aBlockNumber 
Encodes a message entity for the RPC message eth_getStorageAt

#### FogEthereumAPI>>messageSyncing  
Encodes a message entity for the RPC message eth_syncing

#### FogEthereumAPI>>messageGetBalance: anAccountHash blockNumber: anInteger 
Encodes a message entity for the RPC message eth_getBalance

#### FogEthereumAPI>>messageHashrate 
Encodes a message entity for the RPC message eth_hashrate

#### FogEthereumAPI>>messageNewBlockFilter  
Encodes a message entity for the RPC message eth_newBlockFilter

#### FogEthereumAPI>>messageUninstallFilterID: aFilterId  
Encodes a message entity for the RPC message eth_uninstallFilter

#### FogEthereumAPI>>messageProtocolVersion  
Encodes a message entity for the RPC message eth_protocolVersion

#### FogEthereumAPI>>messageGetBlockByNumber: aBlockNumber full: aBoolean 
Encodes a message entity for the RPC message eth_getBlockByNumber

#### FogEthereumAPI>>messageGetUncleByBlockTag: aBlockTag andIndex: anIndex 
Encodes a message entity for the RPC message eth_getUncleByBlockNumberAndIndex

#### FogEthereumAPI>>messageCall: aETHCallDefinition 
Encodes a message entity for the RPC message eth_call

#### FogEthereumAPI>>messageGetBlockByTag: aTag full: aBoolean 
Encodes a message entity for the RPC message eth_getBlockByNumber

#### FogEthereumAPI>>messageSendRawTransaction: aCodeOrCall  
Encodes a message entity for the RPC message eth_sendRawTransaction

#### FogEthereumAPI>>messageGetTransactionByBlockNumber: aBlockNumber andIndex: anIndex 
Encodes a message entity for the RPC message eth_getTransactionByBlockNumberAndIndex

#### FogEthereumAPI>>messageCall: aETHCallDefinition block: blockRef 
Encodes a message entity for the RPC message eth_call

#### FogEthereumAPI>>messageGetCode: anAddress blockNumber: aBlockNumber 
Encodes a message entity for the RPC message eth_getCode

#### FogEthereumAPI>>messageCompileSerpent: aSourceCodeString 
Encodes a message entity for the RPC message eth_compileSerpent

#### FogEthereumAPI>>messageSendTransaction: aETHCallDefinition  
Encodes a message entity for the RPC message eth_sendTransaction

#### FogEthereumAPI>>messageGetFilterLogs: aFilterId 
Encodes a message entity for the RPC message eth_getFilterLogs

#### FogEthereumAPI>>messageGetTransactionCount: anAccountAddress blockNumber: aBlockNumber 
Encodes a message entity for the RPC message eth_getTransactionCount

#### FogEthereumAPI>>messageNewFilter: aETHFilterDefinition  
Encodes a message entity for the RPC message eth_newFilter

#### FogEthereumAPI>>messageGetTransactionByBlockHash: aBlockHash andIndex: anIndex 
Encodes a message entity for the RPC message eth_getTransactionByBlockHashAndIndex

#### FogEthereumAPI>>messageGetCompilers 
Encodes a message entity for the RPC message eth_getCompilers



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
#### FogNetAPI>>messageNetListening 
Encodes a message entity for the RPC message net_listening

#### FogNetAPI>>messageNetVersion   
Encodes a message entity for the RPC message net_version



## FogWeb3
FogWeb3API relative 

### Methods
#### FogWeb3>>sha3_256: aString
Returns Keccak-256. Resolved locally, using Keccak project.

#### FogWeb3>>sha3: aString
Returns Keccak-256 (<em>not</em> the standardized SHA3-256) of the given data.

#### FogWeb3>>clientVersion
Returns the current client version.



## FogWeb3API
Web3 subset of callable RPC messages 


### Methods
#### FogWeb3API>>messageClientVersion 
Encodes a message entity for the RPC message web3_clientVersion

#### FogWeb3API>>messageSha3: aString   
Encodes a message entity for the RPC message web3_sha3





