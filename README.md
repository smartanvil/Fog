# Fog
Pharo Ethereum Driver 

Fog is a library that allows the user to connect to an ethereum based blockchain data base. 

Is based on the Javascript canonical implementation done by Ethereum community [Ethereum Javascript API](https://github.com/ethereum/wiki/wiki/JavaScript-API).



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
  
   


