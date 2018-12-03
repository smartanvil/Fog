# Fog



Pharo Ethereum Driver 

Fog is a library that allows the user to connect to an ethereum based blockchain data base. 

Is based on the Javascript canonical implementation done by Ethereum community [Ethereum Javascript API](https://github.com/ethereum/wiki/wiki/JavaScript-API).


## Dependencies 

Before going further, for avoiding any kind of frustration, let's be clear with the dependencies.

### Geth (or equivalent)
 you will have to have an Ethereum node running or at least accessible for being able to use fog. No endpoint, no fun. 
 
 
Once you installed, as explained in the github site (https://github.com/ethereum/go-ethereum/wiki/Installing-Geth)
Ensure that you run your node exposing the minimal needed services


``` 
geth --rpcapi eth,web3,net,admin
``` 
And if you are wondering how to run a node only for testing, maybe you want to execute something like 

``` 
geth  --nodiscover --mine --minerthreads 1 --maxpeers 0 --verbosity 3 --unlock "0"  --rpcapi eth,web3,net,admin --rpc --testnet
``` 

Finally if you don't want to deal with the creation of the accounts, passwords, etc. Then you may want to check what is happening in this [folder](./scripts/dev.sh) of this project. 



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


### Session & Connection

  Your best friends as a newcomer in Fog are the connection and the session. 
  
  To get new connections with fog is pretty cheap just execute 
  ```
   FogConnection on: 'http://localhost:8545'.  
  ```
  And you will have a almost free connection. (No services, no major object instantiation, etc). 
  
  
  A FogConnection instance, as we can see in the extended [documentation](./FogComm.md)  of the library, allows us already to do many things. 
  But the main idea of the split in between Connection and Session is to be able to provide different flavours of connections, decoupling the domain objects from the data endpoint. 
  
  
  
  For using then Fog as we want it, we have to create a session. 
  To do so, is as easy as:
   
  ```
   session := FogConnection createDefaultConnection session.  
  ```
  or, for non cached session flavour:
  
  ```
   session := FogConnection createDefaultConnection nonCachedSession.  
  ```
  Session are a bit more expensive than connections, specially the default or cached session, which caches any object asked to the connection for faster later access. 
  
  The session is always distributed with a side service (provided by TaskIt - https://github.com/sbragagnolo/taskit), with the mission of allowing polling to the connection and permanent syncing. 
  
  
  The session will be then, your favourite entry point in Fog. And you can see the [extended documentation here](./FogLive.md).
  
### Create an account
   For interacting with contracts you will need to have an account. For the database side you may want to check out the documentation [Account management](http://ethdocs.org/en/latest/account-management.html). 
  
   By the side of Pharo you will need to create an account object with it related hash ID. 
  
 ```smalltalk
     account := FogExternalAccount new
 		hash: self ownerAccountAddress ;
 		name: 'My Account';
 		yourself
 ```


   After this, you will have to set it up in the session or not, depending the kind of usage you want to do. But we kind of generally recommend to do it
  
 ```smalltalk
       session applicationAccount: account.
 ```
   In case of testing, the account that you create for mining, is a good account to use. It will always have enough ether for using 
  
  
### Fetching a block, and inspecting from the block 
    
 The block is the time related abstraction in blockchain systems. [Glossary - Block](http://ethdocs.org/en/latest/glossary.html?highlight=block) Inside of it, we can find a father, the included transactions, and the timestamp, inbetween other less remarkable pieces of information. 
    
    
```
 block := session findBlockByTag: #latest full: true.
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
  transaction := session findTransactionByHash: 'hash'.
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
  instance := session findContractInstanceByHash:'0x2f5d196660eaead329194347e513d486d11984fa' blockNumber: 6814584
```
   This code will bring the contract instance binded to the state it had at the given block number. As well you can use tags instead of numbers
   
```
  instance := session findContractInstanceByHash:'0x2f5d196660eaead329194347e513d486d11984fa' blockTag: 'latest'  
```
  If the contract source code was loaded as a known contract (check in the configuration section), the contract instance will be browsable with GTTools, and it will provide a mirror for interacting with it (check the contract section) 

  
## Navigating the database

   The Ethereum database plays with the abstractions of:
   
   * Block
   * Transaction
   * Accounts
      - Real accounts
      - Deployed contract instances 
   
   The library gives us access to all this information as reifyied objects. Each of these objects has a GTTool inspection extension, focusing on the navigability and in the main data of each object.
   So do not hesitate in inspecting the different objects that you may bring from your session. 
   
   
   
   
## Contracts

  Finally we have the contracts. Contracts are probably the reason for using Ethereum. 
  A deployed contract, in the end, is like a deployed object that is interacted by sending messages, that are executed in transactional fashion, or function, depending on if they do or do not state changes.
  
  So far our implementation does not have a real reification of the contract instance, since it should be based on a session concept, that we do not have yet. Then the current proposed usage is based on the generated reflective system. 
  

### Loading a package of contracts 

   In ethererum there is not notion of package as it is, but there is a notion of files. In a file we can define as much contracts as we want. Then we choose to forget about the files, and talk about this unit of distribution as package. 
   
   
   A session is able to load a package. This package, regardless if it is or not a cached session,  will be accessible by name after by querying the session. 
   
   A package is able to tell it AST, and it points to a set of contract descriptions that are defined on it. 
   
   
   For loading a package just execute. 
   
```smalltalk
package := session
	loadPackageForFileReference: 'provide/here/a/solidity/filename' asFileReference
```
   After, for getting a contract description execute
   
   
   
```
 contractDescription := package descriptions anyone. 
 " Or "
 contractDescription := session findReference: (FogReference new / #filename / #contractName ).
```


### The contract description

   After loading a package, and accessing to a contract description, feel free to inspect it. This object is the Meta type reyfication of a contract. We will use it for mostly every exchange with a deployed contract. 

   The contract description understands many messages, extensively covered in the [documentation](./FogLive.md). Here we will only remark the most useful, in terms of the cycle of usage. 
   
   A contract description understands #mirror and #contract. 
   
   The method #mirror will build and return a mirror for the contract type, that will allow us to do metaprogramming. 
 ```
  contractMirror := contractDescription mirror. 
  contractInstanceMirror := contractMirror instanceMirror. 
 ```  
 
   The method #contract will generate a proxy, that leveraging the mirror, will encapsulate the metaprogramming capabilities for emulating a regular object. 
 ```
  contractProxyGeneratedClass := contractDescription contract. 
 ```  
   
   
### The contract proxy

   The generated contract proxy, by using the Proxybuilder defined in the FogLive project ( not yet documented, since it may change in the near future ), will be a subclass of 
   #FogContractProxy. 
   
   This class will use a Trait also generated by the builder that will implement all the methods of the contract, all the properties of the contract and even the constructor of the contract. 
   
   In all the methods and the constructor , the builder will provide us two flavours: transferring money, or not. 
   
   
   Lets execute the following line and inspect the generated class
 ```    
| session package contract poll |
	session := FogConnection createDefaultConnection nonCachedSession.
	session
		applicationAccount: (session createExternalAccountFor: 'your miner account or whatever').
	package := session
		loadPackageForCode: FogTestingContractProvider public3StatesPollContractSrc
		named: #test.
	pollContractDescription := session findReference: FogReference new / #test / #Public3StatesPoll.
	pollContractDescription contract browse. 

 ```    
   This public3StatesPollContractSrc is an encoded contract used for testing porposes. 
   
  This class will be named #ContractPublicStatesPoll. Aside with it we will find, TContractPublicStatesPoll. 
   
   
```  
   FogContractProxy subclass: #ContractPublic3StatesPoll
   	uses: TContractPublic3StatesPoll
   	slots: { #pollTable => FogContractPropertySlot. 
   				#owner => FogContractPropertySlot }
   	classVariables: {  }
   	package: 'FogGeneratedPublic3StatesPoll'.

   Trait named: #TContractPublic3StatesPoll
   uses: {}
   category: 'FogGeneratedPublic3StatesPoll'.
``` 

  Inside this class(or in the trait as well) we will find many method defined. Let's check first the class side: 
``` 
constructorSession: aSession 
	| instance |
	instance := (self mirror method: #constructor) using: aSession 
				applyOn: self contractDescription 
				valueWithArguments: {} 
				from: (self resolveFromAccount: aSession).
	^ self forInstance: (instance waitIsReady; yourself) at: #latest.

``` 

  This code is a defined in the superclass as subclass responsibilty and is executed by the method #newWithSession: aSession. 
  
  This is the method that will allow us to deploy a contract. 

``` 
   poll := ContractPublic3StatesPoll newWithSession: session. 
```

  The default proxy builder strategy, makes of the constructor a synchronous call. (this is optional, it can be asynchronous).
  
  Therefore, this call will come back once the transaction is finished. 
  
  
  
  Before moving forward, we have to set up the session to the instance. By default is nil. And it requires the user to set it up.
   
```
  poll session: session
   
```
  
  After this, we can inspect the poll, and be able to see it's vars. 
  By default, this contract has not defined any accessor, but if we define, by example owner, we could easily execute 


```
  poll owner   
```

  To see that it responds with our account address. 
  
  This access to the content is completely transparent, thanks to the FogContractPropertySlot, read-only slot that checks the state of the variable at each time that is read.
  
  
  
  
  Finally, if we want to execute a method
  
  There are two kind of methods in ethereum: those that do not modify the state, and those that do modify. 
  
  
  To invoke those that do not modify the state of the contract, it is as easy as sending the proper message.
  
  
```
  self assert: poll allParticipantsHaveVoted 
```

  This is a simple assertion. Of course, since there are not participants registered, this is true. 
  
  
  
  To invoke those that may modify the state, is a little bit more tricky since they do not return a value but a future. 

```
   future := poll  addVoter: '0xAHashToAnAddress'.  
   future onSuccess: [ : v | self inform: 'Added' ].
   
```
     
 

   
### Deploy a contract using reflection

The contract description object respond to the #mirror message. Giving as return a FogContractMirror. This mirror is the representation of the Contract class side. Exposes the constructor method.

```
   constructor := pollDescription mirror constructor.
```
This constructor method is as well a mirror of the contructing method, and it allows to execute the remote method by sending the proper message to the object.
Before showing how to do it, we may need to explain the configuration association array: 
Ethereum method activation ask for execution metadata. As the ammount of gas the gas price, and the account you are using for activating this method (The one that will be charged with the execution price). 
For this meta data we use an array of associations. 

```
  poll := constructor
	using: session
	applyOn: contract
	valueWithArguments: {}
	from: session applicationAccount
	gas: 400000
	gasPrice: 3
	amount: 0
```

  The poll variable, now points to a deployed contract instance, of the class FogContractInstance. 
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
	method := instanceMirror method: #allParticipantsHaveVoted.
```
  
  Finally with the method and the contract instance object at hand we can activate it by sending a similar message as the one we used to the constructor. Depending on the kind of message, if it changes or no state the kind of return of the activation may be different
  
  The following case shows a getter. It should not mean any change of state. So the return is a regular value. 
```
	methodResult := method
		using: session
		applyOn: deployedContract
		valueWithArguments: {}
		from: session applicationAccount
		gas: 1000000
		gasPrice: 2
		amount: 0
```

  The following case illustrates a #addVoter:. It means of course a change of state. Then the return will be a future. 
  
```
    method := instanceMirror method: #addVoter:.
	future := method
		using: session
		applyOn: deployedContract
		valueWithArguments: { '0xaValidHash' }
		from: session applicationAccount
		gas: 1000000
		gasPrice: 2
		amount: 0
```


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
  value := property using: session value: deployedContract at: #latest.
```
   




# Further documentation

  Do not hesitate in reviewing the extended documentations 

[FogComm](./FogComm.md)
[FogLive](./FogLive.md)

 Both of this documentations are generated from the PackageManifest (FogCommManifest / FogLiveManifest).
 Both of this classes, on the class side, have defined the sited examples. 
 
 Just browse them and execute, inspect play :) .
 
 
 
 
 
