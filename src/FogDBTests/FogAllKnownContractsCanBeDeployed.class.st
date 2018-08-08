Class {
	#name : #FogAllKnownContractsCanBeDeployed,
	#superclass : #FogArbitraryAddressesTestCase,
	#category : 'FogDBTests'
}

{ #category : #tests }
FogAllKnownContractsCanBeDeployed >> contractDescriptions [
	^ FogTestingContractProvider contractsDescriptions: session
]

{ #category : #initialization }
FogAllKnownContractsCanBeDeployed >> setUp [
	super setUp.
	self timeLimit: 3 minutes
]

{ #category : #tests }
FogAllKnownContractsCanBeDeployed >> testAllEmptyConstructorsDeploy [
	| instances detectedContracts account |
	account := self ownerAccount.
	instances := self contractDescriptions
		select: [ :d | d hasAst and: [ d mirror constructor parameters size = 0 ] ]
		thenCollect: [ :d | 
			d mirror constructor
				using: session
				applyOn: d
				valueWithArguments: {}
				from: account
				gas: 300000
				gasPrice: 60 ].
	instances do: [ :i | i waitIsReady ].
	self assert: (instances allSatisfy: #isReady).
	detectedContracts := instances
		collect: [ :i | 
			self contractDescriptions
				detect: [ :c | c codeMatchesWith: i contract binary ] ].
	self assert: detectedContracts equals: (instances collect: #contract)
]

{ #category : #tests }
FogAllKnownContractsCanBeDeployed >> testAllFullUsageConstructorsDeploy [
	| instances detectedContracts account |
	account := self ownerAccount.
	instances := self contractDescriptions
		select: [ :d | d hasAst and: [ d mirror constructor parameters size = 1 ] ]
		thenCollect: [ :d | 
			d mirror constructor
				using: session
				applyOn: d
				valueWithArguments: {'arbitraryString'}
				from: account
				gas: 300000
				gasPrice: 60 ].
	instances do: [ :i | i waitIsReady ].
	self assert: (instances allSatisfy: #isReady).
	detectedContracts := instances
		collect:
			[ :i | (session findContractInstanceByHash: i address blockTag: 'latest') contract ].
	self assert: detectedContracts equals: (instances collect: #contract)
]
