tests
testAllFullUsageConstructorsDeploy
	| instances detectedContracts account |
	account := self ownerAccount.
	instances := self contractDescriptions
		select: [ :d | d hasAst and: [ d mirror constructor parameters size = 1 ] ]
		thenCollect: [ :d | 
			d mirror constructor
				applyOn: d
				valueWithArguments: {'arbitraryString'}
				from: account
				gas: 300000
				gasPrice: 60 ].
	instances do: [ :i | i waitIsReady ].
	self assert: (instances allSatisfy: #isReady).
	detectedContracts := instances collect: [ :i | (session findContractBindByHash: i address blockTag: 'latest') contract ].
	self assert: detectedContracts equals: (instances collect: #contract)