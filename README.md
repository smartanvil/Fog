# Fog



Pharo Ethereum Driver 

Fog is a library that allows the user to connect to an ethereum based blockchain data base. 

Is based on the Javascript canonical implementation done by Ethereum community [Ethereum Javascript API](https://github.com/ethereum/wiki/wiki/JavaScript-API).

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

git checkout git@github.com:sbragagnolo/Fog.git

```
Metacello
	new
	baseline: 'Fog';
	repository: 'filetree:///path/to/git-repository/Fog/src';;
	load.
```

## Before starting - configuration

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
  
  

