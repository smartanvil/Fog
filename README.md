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
   
   The library gives us access to all this information as reifyied objects.
   
### Blocks
    
 The block is the time related abstraction in blockchain systems. Inside of it, we can find a father, the included transactions, and the timestamp, inbetween other less remarkable pieces of information. 
    
    
```
 block := FogConnection currentConnection eth getBlockByTag: 'latest' full: true.
```
 This pcode gives us the last processed block. 
 We can use this block as entry point for navigating to the previous blocks by asking for the parent block
 
```
  block := block parent
```
 As well in ethereum we have the concept of uncle blocks, for blocks that were processed at the same time as the parent block [Glossary - Uncle](http://ethdocs.org/en/latest/glossary.html?highlight=uncle)
 
```
  uncles := block uncles. 
```








