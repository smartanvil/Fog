# FogLive - Generated Doc
## Manifest
FogLive is a project that aims to provide object reifications for each of the main concepts in Ethereum. 
FogLive allows to use Blocks, Transactions, Accounts and Contracts as objects, providing along side a Meta programming layer that allows many levels of abstraction going from protocol level and memory access to Contract transparent proxies.

For points of extension you may want to check on: 
   FogSession / FogCachedSession . For the articulation of FogLive with FogComm.
   FogContractDescription . For the building of meta types of contracts from source code. 
   FogContractMirror / FogMirrorSmaccASTBasedBuilder. For what is to the generation of remote mirrors 
   FogContractProxyBuilder / FogContractProxy. For what it goes to code generation for transparent proxy ## Project Examples
```smalltalk
exampleSetUpDefaultApplicationAccount
	| session |
	session := FogConnection createDefaultConnection nonCachedSession.
	session applicationAccount: (session createExternalAccountFor: '0x81bfba8301a073a010e9fb71fab514e53d1cc3f0')
```
```smalltalk
exampleCreateASession
	| session | 
	session := FogConnection createDefaultConnection nonCachedSession .
```
```smalltalk
exampleCreateACachedSession
	| session |
	session := FogConnection createDefaultConnection session
```
```smalltalk
exampleHashBlock
	| session |
	session := FogConnection createDefaultConnection nonCachedSession.
	session findBlockByHash: '0x50adbd5730fa577febfec37764112f111bded99952c15ef6b82ff3527ec6557e' full: true
```
```smalltalk
exampleNumberedBlock
	| session |
	session := FogConnection createDefaultConnection nonCachedSession.
	session findBlockByNumber: 6814584 full: true
```
```smalltalk
exampleLatestBlock
	| session |
	session := FogConnection createDefaultConnection nonCachedSession.
	session findBlockByTag: #latest full: true
```
```smalltalk
exampleBlockNumberIdTransaction
	| session |
	session := FogConnection createDefaultConnection nonCachedSession.
	session findTransactionByBlockNumber: 6814584 andIndex: 1
```
```smalltalk
exampleBlockHashIdTransaction
	| session |
	session := FogConnection createDefaultConnection nonCachedSession.
	session
		findTransactionByBlockHash: '0x50adbd5730fa577febfec37764112f111bded99952c15ef6b82ff3527ec6557e'
		andIndex: 1
```
```smalltalk
exampleHashContract
	| session |
	session := FogConnection createDefaultConnection nonCachedSession.
	session
		findContractInstanceByHash:'0x2f5d196660eaead329194347e513d486d11984fa' blockNumber: 6814584
```
```smalltalk
exampleHashTransaction
	| session |
	session := FogConnection createDefaultConnection nonCachedSession.
	session
		findTransactionByHash: '0x49bff10a93a720bfa7dd7c46bbf34966274c3a4ac0f51875951c1282601fbf0d'
```
```smalltalk
exampleHashContractBlockTag
	| session |
	session := FogConnection createDefaultConnection nonCachedSession.
	session
		findContractInstanceByHash: '0x2f5d196660eaead329194347e513d486d11984fa'
		blockTag: #latest
```
```smalltalk
exampleHashContractBlockNumber
	| session |
	session := FogConnection createDefaultConnection nonCachedSession.
	session
		findContractInstanceByHash:'0x2f5d196660eaead329194347e513d486d11984fa' blockNumber: 6814584
```
```smalltalk
examplePackageLoading
	| session package |
	session := FogConnection createDefaultConnection nonCachedSession.
	package := session
		loadPackageForCode: FogTestingContractProvider public3StatesPollContractSrc
		named: #test.
```
```smalltalk
examplePackageFReferenceLoading
	| session package |
	session := FogConnection createDefaultConnection nonCachedSession.
	package := session
		loadPackageForFileReference: 'provide/here/a/solidity/file' asFileReference 
```
```smalltalk
exampleContractDescriptionLoading
	| session package contract |
	session := FogConnection createDefaultConnection nonCachedSession.
	package := session
		loadPackageForCode: FogTestingContractProvider public3StatesPollContractSrc
		named: #test.
	contract := package descriptions anyOne .
	
```
```smalltalk
exampleContractDescriptionLoadingByReference
	| session package contract |
	session := FogConnection createDefaultConnection nonCachedSession.
	package := session
		loadPackageForCode: FogTestingContractProvider public3StatesPollContractSrc
		named: #test.
	contract := session findReference: FogReference new / #test / #Public3StatesPoll
```
```smalltalk
exampleContractProxyGeneration
	| session package contract |
	session := FogConnection createDefaultConnection nonCachedSession.
	session
		applicationAccount: (session createExternalAccountFor: '0x81bfba8301a073a010e9fb71fab514e53d1cc3f0').
	package := session
		loadPackageForCode: FogTestingContractProvider public3StatesPollContractSrc
		named: #test.
	contract := session findReference: FogReference new / #test / #Public3StatesPoll.
	self assert: contract contract name = #ContractPublic3StatesPoll.
	contract contract browse
```
```smalltalk
exampleContractProxyDeployAndApplyMethod
	| session package contract poll |
	session := FogConnection createDefaultConnection nonCachedSession.
	session
		applicationAccount: (session createExternalAccountFor: '0x81bfba8301a073a010e9fb71fab514e53d1cc3f0').
	package := session
		loadPackageForCode: FogTestingContractProvider public3StatesPollContractSrc
		named: #test.
	contract := session findReference: FogReference new / #test / #Public3StatesPoll.
	poll := contract contract newWithSession: session.
	poll session: session.
	self assert: poll allParticipantsHaveVoted = true
```
```smalltalk
exampleContractProxyGenerationCreateInstanceForExistingContractAtSomePoint
	| session package contract |
	session := FogConnection createDefaultConnection nonCachedSession.
	session
		applicationAccount: (session createExternalAccountFor: '0x81bfba8301a073a010e9fb71fab514e53d1cc3f0').
	package := session
		loadPackageForCode: FogTestingContractProvider public3StatesPollContractSrc
		named: #test.
	contract := session findReference: FogReference new / #test / #Public3StatesPoll.
	self assert: contract contract name = #ContractPublic3StatesPoll.
	contract contract
		forInstance: (session findContractInstanceByHash: '#provide here a hash' blockTag: #latest)
		at: #'provide here some block number or hash'
```
```smalltalk
exampleContractProxyDeploy
	| session package contract poll |
	session := FogConnection createDefaultConnection nonCachedSession.
	session
		applicationAccount: (session createExternalAccountFor: '0x81bfba8301a073a010e9fb71fab514e53d1cc3f0').
	package := session
		loadPackageForCode: FogTestingContractProvider public3StatesPollContractSrc
		named: #test.
	contract := session findReference: FogReference new / #test / #Public3StatesPoll.
	poll := contract contract newWithSession: session
```
```smalltalk
exampleContractProxyPropertyAccess
	| session package contract poll |
	session := FogConnection createDefaultConnection nonCachedSession.
	session
		applicationAccount: (session createExternalAccountFor: '0x81bfba8301a073a010e9fb71fab514e53d1cc3f0').
	package := session
		loadPackageForCode: FogTestingContractProvider public3StatesPollContractSrc
		named: #test.
	contract := session findReference: FogReference new / #test / #Public3StatesPoll.
	poll := contract contract newWithSession: session.
	poll session: session.
	poll readSlotNamed: #owner. " For having access to var owner, you should define the accessor at the class ContractPublic3StatesPoll. "
```
```smalltalk
exampleContractProxyGenerationCreateInstanceForExistingContract
	| session package contract |
	session := FogConnection createDefaultConnection nonCachedSession.
	session
		applicationAccount: (session createExternalAccountFor: '0x81bfba8301a073a010e9fb71fab514e53d1cc3f0').
	package := session
		loadPackageForCode: FogTestingContractProvider public3StatesPollContractSrc
		named: #test.
	contract := session findReference: FogReference new / #test / #Public3StatesPoll.
	self assert: contract contract name = #ContractPublic3StatesPoll.
	contract contract
		forInstance: (session findContractInstanceByHash: '#provide here a hash' blockTag: #latest)
```
```smalltalk
exampleApplyConstructorByUsingMirrors
	| session package contract constructor deployedContract |
	session := FogConnection createDefaultConnection nonCachedSession.
	session
		applicationAccount: (session createExternalAccountFor: '0x81bfba8301a073a010e9fb71fab514e53d1cc3f0').
	package := session
		loadPackageForCode: FogTestingContractProvider public3StatesPollContractSrc
		named: #test.
	contract := session findReference: FogReference new / #test / #Public3StatesPoll.
	constructor := contract mirror constructor.
	deployedContract := constructor
		using: session
		applyOn: contract
		valueWithArguments: {}
		from: session applicationAccount
		gas: 400000
		gasPrice: 3
		amount: 0
	"deployedContract waitIsReady."	" Uncomment this for forcing to wait for the contract to be fully deployed"
```
```smalltalk
exampleContractPropertyMirrorAccess
	| session package contract constructor deployedContract property value |
	session := FogConnection createDefaultConnection nonCachedSession.
	session applicationAccount: (session createExternalAccountFor: '0x81bfba8301a073a010e9fb71fab514e53d1cc3f0').
	package := session loadPackageForCode: FogTestingContractProvider public3StatesPollContractSrc named: #test.
	contract := session findReference: FogReference new / #test / #Public3StatesPoll.
	constructor := contract mirror constructor.
	deployedContract := constructor
		using: session
		applyOn: contract
		valueWithArguments: {}
		from: session applicationAccount
		gas: 400000
		gasPrice: 3
		amount: 0.
	deployedContract waitIsReady.
	property := contract mirror instanceMirror property: #owner.
	value := property using: session value: deployedContract at: #latest.
```
```smalltalk
exampleApplyMethodByUsingMirrors
	| session package contract constructor deployedContract method methodResult |
	session := FogConnection createDefaultConnection nonCachedSession.
	session applicationAccount: (session createExternalAccountFor: '0x81bfba8301a073a010e9fb71fab514e53d1cc3f0').
	package := session loadPackageForCode: FogTestingContractProvider public3StatesPollContractSrc named: #test.
	contract := session findReference: FogReference new / #test / #Public3StatesPoll.
	constructor := contract mirror constructor.
	deployedContract := constructor
		using: session
		applyOn: contract
		valueWithArguments: {}
		from: session applicationAccount.
	deployedContract waitIsReady.
	method := contract mirror instanceMirror method: #allParticipantsHaveVoted.
	methodResult := method
		using: session
		applyOn: deployedContract
		valueWithArguments: {}
		from: session applicationAccount
		gas: 1000000
		gasPrice: 2
		amount: 0
```


## FogAccount
Represents an Account in ethereum network. It counts with three subclasses , contract , external and null - account

### Properties
session
name
address

### Methods
#### FogAccount>>isAccount
An account, is by default always an account, despite if it is a contract or an external account. It does not happens the same with the NoAccount

#### FogAccount>>balance
Returns the account's current balance

#### FogAccount>>address
Returns the account's hash address

#### FogAccount>>isContract
This method allows to know the kind of account that we are dealing with: Contract / External

#### FogAccount>>balanceOn: aBlockNumberOrHash
Returns the account's  balance at the aBlockNumberOrHash block



## FogBlock
Block. This is a full representation of a Ethereum block. It has some lazy initialization methods, as, parent, transactions, uncles. 

### Properties
session
full
transactions
difficulty
extraData
gasLimit
gasUsed
logsBloom
miner
mixHash
nonce
number
size
parentHash
receiptsRoot
sha3Uncles
stateRoot
totalDifficulty
transactionsRoot
uncles
timestamp
blockHash
transactionsHashes
parent
unclesHashes
relatedContracts
relatedStorage
receiptRoot

### Methods
#### FogBlock>>amountOfTransactions 
Returns the amount of transactions stored in this block

#### FogBlock>>blockHash
Returns Block's hash

#### FogBlock>>sha3Uncles
Returns the addresses of the block's uncles

#### FogBlock>>transactions
Returns a collection with all the transaction objects belonging to this block

#### FogBlock>>transactionsRoot
Returns the block's transactionRoot field

#### FogBlock>>gasLimit
Returns the limit of gas applyed to this block

#### FogBlock>>next
Returns the block holding the next block number

#### FogBlock>>size
Returns the size of the block

#### FogBlock>>privateBlockHash
Returns the block's hash. This name is renamed to avoid problems with the object's hash definition

#### FogBlock>>mixHash
Returns the block's mixHash field

#### FogBlock>>difficulty
Returns the block's dificulty

#### FogBlock>>stateRoot
Returns block's stateRoot field

#### FogBlock>>uncles
Returns a collection with all uncle blocks of this block. 

#### FogBlock>>receiptRoot: aString
Returns block's receiptRoot field

#### FogBlock>>timestamp
Returns the block's timestamp field

#### FogBlock>>parentHash
Returns the block's parent hash

#### FogBlock>>logsBloom
Returns the block's logs bloom field

#### FogBlock>>miner
Returns the miner hash

#### FogBlock>>nonce
Returns the block's nounce

#### FogBlock>>transactionsHashes
Returns a collection with all the transaction hashes  belonging to this block

#### FogBlock>>accounts
Returns a collection with all accounts related with this block

#### FogBlock>>forceLoad
Forces the creation of each of the related objects: transactions, parent block, uncle blocks

#### FogBlock>>totalDifficulty
Returns the block's totalDifficulty field

#### FogBlock>>gasUsed
Returns the gas used in this block

#### FogBlock>>parent
Returns the block's parent block object

#### FogBlock>>number
Returns the block's number

#### FogBlock>>previous
Returns the block holding the previous block number

#### FogBlock>>extraData 
Returns the block's extraData field



## FogCachedSession
This connection attaches a regular cache 

### Properties
connection
monitor
applicationAccount
packages
cache

### Methods
#### FogCachedSession>>cache
It returns the Cache used by the session. The default is the singleton located in FogCache current. 



## FogConfiguration
Object/ class broker of file locations and other configurations 

### Class Methods
#### FogConfiguration class>>fogCompilingFolder
It returns the location of the compiling folder. For compiling solidity files

#### FogConfiguration class>>fogFolder
It returns the location of the Fog folder. Umbrella of the rest of folders

#### FogConfiguration class>>fogTempFolder
It returns the location of the temp folder. used for generating files for compilation

#### FogConfiguration class>>fogTestFolder
It returns the location of the test folder. Used during tests for generating files



## FogConstantMirror
I represents an slot that is not defined as storage 

### Properties
name
typename
id
type
layout
value

### Methods
#### FogConstantMirror>>using: session value: aContractBind at: aBlockTagNumberOrHash
Polimorphic with the superclass, it only redefines this method which returns always the same value



## FogConstructorMirror
This is a specific kind of method, that is applied in a different way, and it represents a contructor. 

### Properties
parameters
name

### Methods
#### FogConstructorMirror>>using: aSession applyOn: aContractDescription valueWithArguments: aCollection from: anAccount amount: anAmount
Returns a contract instance, result of applying the contructor (what means a contract deployment) using the given setup variables. It delegates the calculation of gas and gas price to the session 

#### FogConstructorMirror>>hasParameters
Returns true if it has parameters. False if it does not expect any parameter

#### FogConstructorMirror>>using: aSession applyOn: aContractDescription valueWithArguments: aCollection from: anAccount
Returns a contract instance, result of applying the contructor (what means a contract deployment) using the given setup variables. It delegates the calculation of gas and gas price to the session. It transfers no money during the deployment.
		

#### FogConstructorMirror>>using: aSession applyOn: aContractDescription valueWithArguments: aCollection from: anAccount gas: aGasAmount gasPrice: aGasPrice
Returns a contract instance,  result of applying the contructor (what means a contract deployment) using the given setup variables. It transfer no money during contract deployment

#### FogConstructorMirror>>using: aSession applyOn: aContractDescription valueWithArguments: aCollection from: anAccount gas: aGasAmount gasPrice: aGasPrice amount: anAmount
Returns a contract instance,  result of applying the contructor (what means a contract deployment) using the given setup variables.



## FogContractDescription
Full contract ob ject. ABI + Binary + Runtime . Normally pointing a block chain deployed contract 

### Properties
binary
runtime
abi
name
mirror
methods
contract
source
package

### Methods
#### FogContractDescription>>reference
It returns the reference as the way to point to this contract description in this session.

#### FogContractDescription>>source
Returns the source code (or nil if it does not have it)

#### FogContractDescription>>hasRuntime
Informs if the contract description counts with the runtime representation (running deployed bytecode)

#### FogContractDescription>>hasSource
Informs if the contract description counts with source code

#### FogContractDescription>>package
It return's the package to whom it belongs. (Fog adds the concept of package, that represent all the contracts belonging to the same file)

#### FogContractDescription>>mirror
It returns a contract's mirror generated by using the AST information. It requires to have an AST attached. It would fail if it does not have one.

#### FogContractDescription>>hasBinary
Informs if the contract description counts with the binary representation (deployable bytecode)

#### FogContractDescription>>contract
It returns a contract's generated class, based on the ContractProxy generation. This generated class will provide transparent access to a remote contract 

#### FogContractDescription>>hasAbi
Informs if the ABI was provided during the creation of the contract description

#### FogContractDescription>>binaryHash
Returns the MD5 hash of the binary bytecode of the contract. This may be used for comparing descriptions

#### FogContractDescription>>versionHash
It generate a version number based on the hash of the runtime bytecode, the binary bytecode and the source code

#### FogContractDescription>>types
It returns all the types used inside the ast of the contract

#### FogContractDescription>>name
It returns the name of the contract

#### FogContractDescription>>hasAst
Informs if the AST (source code) was provided during the creation of the contract description



## FogContractInstance
Contract account. Related with a contract object (EVM bytecode ). 

### Properties
session
name
address
code
abi
contract

### Methods
#### FogContractInstance>>proxy
Returns a proxy object to the contract at the current #latest state. 

#### FogContractInstance>>isContract
A contract account is a contract. This method returns always true in this subclass

#### FogContractInstance>>mirror
Returns the contract's instance mirror

#### FogContractInstance>>contract
Returns the account's contract description. This object represents the MetaType of a Contract

#### FogContractInstance>>proxyAt: aBlockTagNumberOrHash
Returns a proxy object to the contract at the a given state (blockhash -tag - number).



## FogContractInstanceMirror
This objects mirrors a contract. 
Allowing to fetch raw content and execute methods on given instances

### Properties
properties
methods
contractMirror

### Methods
#### FogContractInstanceMirror>>property: aName
It returns the property mirror named as the given parameter

#### FogContractInstanceMirror>>using: session property: aPropertyName on: anInstance at: aBlockTagNumberOrHash
It returns the state of a property by name on the given state

#### FogContractInstanceMirror>>methods
Returns all the methods of this contract instance

#### FogContractInstanceMirror>>properties
Returns all the properties of a contract instance



## FogContractMirror
This mirror exposes Contract level meta. as the types defined by the contract and the constructor method mirror .

### Properties
types
constructor
instanceMirror

### Methods
#### FogContractMirror>>constructor
Returns the constructor of this contract.

#### FogContractMirror>>types
Returns the types used by the contract

#### FogContractMirror>>instanceMirror
Returns the contract's instance side mirror



## FogExternalAccount
Account related with a real user. This account uses most of the default account behaviour.

### Methods
#### FogExternalAccount>>isAccount
The external account is treated as an account. This method returns always true



## FogMethodMirror
Method reification for method call. 

### Properties
modifiesState
name
parameters
return

### Methods
#### FogMethodMirror>>signature
Returns the method signature.

#### FogMethodMirror>>using: aSession applyOn: anETHContractInstance at: aBlockHash valueWithArguments: aCollection from: anAccount amount: anAmount
Returns a result of applying the method (depending on the kind of method if may respond with data or with a future) using the given setup variables. It delegates the calculation of gas and gas price to the session. 
		

#### FogMethodMirror>>name
Returns the method's name

#### FogMethodMirror>>hasParameters
Returns true if it has parameters. False if it does not expect any parameter

#### FogMethodMirror>>parameters
Returns the method's parameters: Name and type

#### FogMethodMirror>>using: aSession applyOn: anETHContractInstance at: aBlockHash valueWithArguments: aCollection from: anAccount
Returns a result of applying the method (depending on the kind of method if may respond with data or with a future) using the given setup variables. It delegates the calculation of gas and gas price to the session. It transfers no money during the execution.
		

#### FogMethodMirror>>using: aSession applyOn: anETHContractInstance valueWithArguments: aCollection from: anAccount gas: aGasAmount gasPrice: aGasPrice
Returns a result of applying the method (depending on the kind of method if may respond with data or with a future) using the given setup variables. It transfers no money during the execution.
		

#### FogMethodMirror>>isStateModifier
Returns true the method is supposed to modify state on call

#### FogMethodMirror>>returnType
Returns the returning type

#### FogMethodMirror>>using: aSession applyOn: anETHContractInstance valueWithArguments: aCollection from: anAccount gas: aGasAmount gasPrice: aGasPrice amount: anAmount
Returns a result of applying the method (depending on the kind of method if may respond with data or with a future) using the given setup variables. 
		



## FogNoAccount
No account objet. For avoiding nil on transactions of contract deployment

### Methods
#### FogNoAccount>>isAccount
The NoAccount is not an account and is not a contract



## FogPackage
A package is the best name we found for a the representation ofthe contracts included in a solidity file. 
Normally this object contains the source of the file, the full ast and the contract descirptions loaded .
For navigation, a package must have a name.


### Properties
name
descriptions
ast
source

### Methods
#### FogPackage>>reference
Returns a reference to point this package in a specific session.

#### FogPackage>>source
It returns the source code of the package

#### FogPackage>>descriptions
It returns all the contract descriptions loaded from this package (or file)

#### FogPackage>>ast
Returns the AST of the package



## FogPropertyMirror
Definition of a contract field. 


### Properties
name
typename
id
type
layout

### Methods
#### FogPropertyMirror>>using: aSession value: aContractAddress at: aBlockTagNumberOrHash
It returns the value of this property by using a given session, a contract and a block number 

#### FogPropertyMirror>>id
It returns the ID of the property. what means it position in the contract

#### FogPropertyMirror>>layout
It returns the layout of the property. Object in charge of the memory mapping

#### FogPropertyMirror>>name
It returns name of the property

#### FogPropertyMirror>>type
It returns the type of the property



## FogReference
This reference is a REALLY naive implementation of names for contracts and packages.
It's not yet fully needed, but it's intended to make easier the query of loaded contracts.
Maybe it can be extended to access other objects, as blocks, transactions, etc. but so far, the query is in charge of UQLL.

### Properties
parts

### Methods
#### FogReference>>/ aPart
Allows to add a name to navigate a reference. It works as analogy of file reference, but for packages and contract descriptions



## FogSession
A session works as a facade for accessing the Fog connection, but recovering nice objects, allowing some very basic queries.
A session as well works as a facade for the same domain objects to know about their basic encoding, and it dispatches the messages through the given connection. 
This allows a really nice point of extention, allowin programmers to change some specifities of: 
	- encoding 
	- gas calculation 
	- gas price calculation 
	- caching access to specific objects
	- dispathing to other kind of connections to use other kind of blockchain clients.
	
Each session provides a transaction monitor which allows the usage of futures on transactional calls. 



### Properties
connection
monitor
applicationAccount
packages

### Methods
#### FogSession>>connection: aConnection
It allows to setup the connection

#### FogSession>>applicationAccount
It returns application account setted up in this session

#### FogSession>>findContractInstanceByHash: aContractAddress blockNumber: aBlockNumber
It returns an already existing ContractInstance object or it creates one, pointing to the contract state at the given block number

#### FogSession>>findBlockByNumber: aBlockBumber full: aBoolean
It returns an already existing Block (fully loaded or not) object or it creates one, for the given block number 

#### FogSession>>findPackageNamed: aName
It returns Package named as the given name

#### FogSession>>findTransactionByBlockHash: aBlockHash andIndex: aTxIndex
It returns the transaction at the given index of an specific block hash

#### FogSession>>monitor
It returns the monitor service of the session

#### FogSession>>loadPackageForFileReference: aFileReference
It loades a new package object into the session, named as the name of a given fileReference, by using the source code in this file reference.

#### FogSession>>loadPackage: aPackage with: aCode
It loades a package object into the session, by using the given source code.

#### FogSession>>coinBase
It returns the coin base of the related Ethereum client.

#### FogSession>>findTransactionByBlockNumber: aBlockNumber andIndex: anIndex
It returns the transaction at the given index of an specific block number

#### FogSession>>findAccountByHash: aString blockNumber: aBlockNumber
It returns an already existing Account object or it creates one, pointing to the state at an specific block number 

#### FogSession>>findBlockByHashOrNumber: aBlockId full: aBoolean
It returns an already existing Block (fully loaded or not) object or it creates one, for the given block hash or number 

#### FogSession>>findContractDescriptionForBinaryCode: aCode
It returns an already existing ContractDescription object or it creates one, pointing to the contract bytecode at the given block number

#### FogSession>>findContractInstanceByHash: aContractAddress blockTag: aBlockTag
It returns an already existing ContractInstance object or it creates one, pointing to the contract state at the given block tag

#### FogSession>>findPackageReference: aReference
It returns Package referenced as the given reference 

#### FogSession>>applicationAccount: anAccount
It allows the setup of an application account. This account would be used for covering the expenses of the transactions, as used as #from field by default

#### FogSession>>findAccountByHash: aString blockHash: aBlockHash
It returns an already existing Account object or it creates one, pointing to the state at an specific block hash 

#### FogSession>>findTransactionByHash: aTransactionHash
It returns the transaction at the transaction hash

#### FogSession>>findBlockByHash: aBlockHash full: aBoolean
It returns an already existing Block (fully loaded or not) object or it creates one, for the given block hash 

#### FogSession>>finalize
It finalizes a session. This method is mean to be called by the garbage collector. It finalizes the monitor service attached to the session.

#### FogSession>>findAccountByHash: aString blockTag: aBlockTag
It returns an already existing Account object or it creates one, pointing to the state at an specific block tag 

#### FogSession>>findTransactionByBlockTag: aBlockTag andIndex: anIndex
It returns the transaction at the given index of an specific block tag

#### FogSession>>findBlockByTag: aTag full: aBoolean
It returns an already existing Block (fully loaded or not) object or it creates one, for the given block tag 

#### FogSession>>findExternalAccountByHash: aString
It returns an already existing ExternalAccount object or it creates one, pointing to the account state at the given block number. It ensure the ExternalAccount type

#### FogSession>>findLastBlock
It returns an already existing fully loaded Block object or it creates one, for the latest block 

#### FogSession>>loadPackageForCode: aCode named: aName 
It loades a new package object into the session, named as the given name, by using the given source code.

#### FogSession>>packages
It returns all the available packages



## FogTransaction
This is a ethereum applyied transaction representation that has some lazy initializatyion methods as block .

### Properties
session
source
s
blockNumber
r
nonce
blockHash
value
gasPrice
from
hash
gas
input
to
transactionIndex
v
block
toAddress
fromAddress

### Methods
#### FogTransaction>>timestamp
Returns the timestamp when this transaction was accepted. (It refers to the block's timestamp and not to the transaction issued timestamp)

#### FogTransaction>>amount
Return the amount trasnferred by this transaction in Wei

#### FogTransaction>>accounts
It returns the account objects related to the transaction

#### FogTransaction>>block
Returns the block to which whom belongs this transaction 

#### FogTransaction>>from
Returns the from account

#### FogTransaction>>to
Returns the hash address of the #to account

#### FogTransaction>>transactionIndex
Returns the number of transaction (ordinal) in the holding block

#### FogTransaction>>blockNumber
Returns the number of the block to whom belongs this transaction

#### FogTransaction>>gasPrice
Returns price payed per gas unit by this transaction

#### FogTransaction>>toAddress
Returns the hash address of the #to account

#### FogTransaction>>gas
Returns the amount of gas used by this transaction

#### FogTransaction>>fromAddress
Returns the hash address of the #from account



## FogTransactionMonitor
A transaction monitor is in charge of resolving a related future, by digging into the geth client 

### Properties
transactionHash
future
timeLeft
session

### Methods
#### FogTransactionMonitor>>future
It returns the future for the ongoing transaction. It usage is highly discouraged.

#### FogTransactionMonitor>>register: aDuration
It registers a time window. Used by the monitor service to expire the monitors.

#### FogTransactionMonitor>>check
It checks if the transaction has been executed, in which case it deploys the related future.

#### FogTransactionMonitor>>timeLeft
It returns the time to live of this monitor. The default initial value is 30 minutes



## FogTransactionMonitorService
This service is polling for checking up transaction monitors resolution 

### Properties
worker
stopRequested
stopCallback
stopCallbacks
stepDelay
monitors
session

### Methods
#### FogTransactionMonitorService>>monitors
It returns all the transaction's monitors used by this service



## FogType
Abstract type, it just declares some abstract methods 

### Methods
#### FogType>>unpack: aString using: aFogPacker
Subclass responsibilty. It unpacks (or unmarshal ) a content according to the type, using a packing object 

#### FogType>>pack: aString using: aFogPacker
Subclass responsibilty. It packs (or marshal ) a content according to the type, using a packing object 



