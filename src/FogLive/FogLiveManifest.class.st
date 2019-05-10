"
FogLive is a project that aims to provide object reifications for each of the main concepts in Ethereum. 

FogLive allows to use Blocks, Transactions, Accounts and Contracts as objects, providing along side a Meta programming layer that allows many levels of abstraction going from protocol level and memory access to Contract transparent proxies.


For points of extension you may want to check on: 

   FogSession / FogCachedSession . For the articulation of FogLive with FogComm.
   FogContractDescription . For the building of meta types of contracts from source code. 
   FogContractMirror / FogMirrorSmaccASTBasedBuilder. For what is to the generation of remote mirrors 
   FogContractProxyBuilder / FogContractProxy. For what it goes to code generation for transparent proxy 
"
Class {
	#name : #FogLiveManifest,
	#superclass : #PackageManifest,
	#category : #'FogLive-Manifest'
}

{ #category : #'e- apply methods by reflection' }
FogLiveManifest class >> exampleApplyConstructorByUsingMirrors [
	<example>
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
]

{ #category : #'e- apply methods by reflection' }
FogLiveManifest class >> exampleApplyMethodByUsingMirrors [
	<example>
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
]

{ #category : #'b- session usage' }
FogLiveManifest class >> exampleBlockHashIdTransaction [
	<example>
	| session |
	session := FogConnection createDefaultConnection nonCachedSession.
	session
		findTransactionByBlockHash: '0x50adbd5730fa577febfec37764112f111bded99952c15ef6b82ff3527ec6557e'
		andIndex: 1
]

{ #category : #'b- session usage' }
FogLiveManifest class >> exampleBlockNumberIdTransaction [
	<example>
	| session |
	session := FogConnection createDefaultConnection nonCachedSession.
	session findTransactionByBlockNumber: 6814584 andIndex: 1
]

{ #category : #'c- package and contract loading' }
FogLiveManifest class >> exampleContractDescriptionLoading [
	<example>
	| session package contract |
	session := FogConnection createDefaultConnection nonCachedSession.
	package := session
		loadPackageForCode: FogTestingContractProvider public3StatesPollContractSrc
		named: #test.
	contract := package descriptions anyOne .
	
]

{ #category : #'c- package and contract loading' }
FogLiveManifest class >> exampleContractDescriptionLoadingByReference [
	<example>
	| session package contract |
	session := FogConnection createDefaultConnection nonCachedSession.
	package := session
		loadPackageForCode: FogTestingContractProvider public3StatesPollContractSrc
		named: #test.
	contract := session findReference: FogReference new / #test / #Public3StatesPoll
]

{ #category : #'e- apply methods by reflection' }
FogLiveManifest class >> exampleContractPropertyMirrorAccess [
	<example>
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
]

{ #category : #'d- contract proxy generation' }
FogLiveManifest class >> exampleContractProxyDeploy [
	<example>
	| session package contract poll |
	session := FogConnection createDefaultConnection nonCachedSession.
	session
		applicationAccount: (session createExternalAccountFor: '0x81bfba8301a073a010e9fb71fab514e53d1cc3f0').
	package := session
		loadPackageForCode: FogTestingContractProvider public3StatesPollContractSrc
		named: #test.
	contract := session findReference: FogReference new / #test / #Public3StatesPoll.
	poll := contract contract newWithSession: session
]

{ #category : #'d- contract proxy generation' }
FogLiveManifest class >> exampleContractProxyDeployAndApplyMethod [
	<example>
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
]

{ #category : #'d- contract proxy generation' }
FogLiveManifest class >> exampleContractProxyGeneration [
	<example>
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
]

{ #category : #'d- contract proxy generation' }
FogLiveManifest class >> exampleContractProxyGenerationCreateInstanceForExistingContract [
	<example>
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
]

{ #category : #'d- contract proxy generation' }
FogLiveManifest class >> exampleContractProxyGenerationCreateInstanceForExistingContractAtSomePoint [
	<example>
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
]

{ #category : #'d- contract proxy generation' }
FogLiveManifest class >> exampleContractProxyPropertyAccess [
	<example>
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
]

{ #category : #'a- create session' }
FogLiveManifest class >> exampleCreateACachedSession [
	<example>
	| session |
	session := FogConnection createDefaultConnection session
]

{ #category : #'a- create session' }
FogLiveManifest class >> exampleCreateASession [
	<example>
	| session | 
	session := FogConnection createDefaultConnection nonCachedSession .
]

{ #category : #'b- session usage' }
FogLiveManifest class >> exampleHashBlock [
	<example>
	| session |
	session := FogConnection createDefaultConnection nonCachedSession.
	session findBlockByHash: '0x50adbd5730fa577febfec37764112f111bded99952c15ef6b82ff3527ec6557e' full: true
]

{ #category : #'b- session usage' }
FogLiveManifest class >> exampleHashContract [
	<example>
	| session |
	session := FogConnection createDefaultConnection nonCachedSession.
	session
		findContractInstanceByHash:'0x2f5d196660eaead329194347e513d486d11984fa' blockNumber: 6814584
]

{ #category : #'b- session usage' }
FogLiveManifest class >> exampleHashContractBlockNumber [
	<example>
	| session |
	session := FogConnection createDefaultConnection nonCachedSession.
	session
		findContractInstanceByHash:'0x2f5d196660eaead329194347e513d486d11984fa' blockNumber: 6814584
]

{ #category : #'b- session usage' }
FogLiveManifest class >> exampleHashContractBlockTag [
	<example>
	| session |
	session := FogConnection createDefaultConnection nonCachedSession.
	session
		findContractInstanceByHash: '0x2f5d196660eaead329194347e513d486d11984fa'
		blockTag: #latest
]

{ #category : #'b- session usage' }
FogLiveManifest class >> exampleHashTransaction [
	<example>
	| session |
	session := FogConnection createDefaultConnection nonCachedSession.
	session
		findTransactionByHash: '0x49bff10a93a720bfa7dd7c46bbf34966274c3a4ac0f51875951c1282601fbf0d'
]

{ #category : #'b- session usage' }
FogLiveManifest class >> exampleLatestBlock [
	<example>
	| session |
	session := FogConnection createDefaultConnection nonCachedSession.
	session findBlockByTag: #latest full: true
]

{ #category : #'b- session usage' }
FogLiveManifest class >> exampleNumberedBlock [
	<example>
	| session |
	session := FogConnection createDefaultConnection nonCachedSession.
	session findBlockByNumber: 6814584 full: true
]

{ #category : #'c- package and contract loading' }
FogLiveManifest class >> examplePackageFReferenceLoading [
	<example>
	| session package |
	session := FogConnection createDefaultConnection nonCachedSession.
	package := session
		loadPackageForFileReference: 'provide/here/a/solidity/file' asFileReference 
]

{ #category : #'c- package and contract loading' }
FogLiveManifest class >> examplePackageLoading [
	<example>
	| session package |
	session := FogConnection createDefaultConnection nonCachedSession.
	package := session
		loadPackageForCode: FogTestingContractProvider public3StatesPollContractSrc
		named: #test.

]

{ #category : #'a- create session' }
FogLiveManifest class >> exampleSetUpDefaultApplicationAccount [
	<example>
	| session |
	session := FogConnection createDefaultConnection nonCachedSession.
	session applicationAccount: (session createExternalAccountFor: '0x81bfba8301a073a010e9fb71fab514e53d1cc3f0')
]
