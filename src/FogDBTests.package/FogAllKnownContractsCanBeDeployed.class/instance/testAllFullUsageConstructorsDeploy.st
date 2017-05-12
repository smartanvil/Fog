tests
testAllFullUsageConstructorsDeploy
	| instances detectedContracts account |
	account := self ownerAccount.
	instances := self contractDescriptions
		select: [ :d | d hasAst and: [ d mirror constructor parameters size = 1 ] ]
		thenCollect: [ :d | d mirror constructor applyOn: d valueWithArguments: {'arbitraryString'} sender: account ].
	instances do: [ :i | i waitIsReady ].
	self assert: (instances allSatisfy: #isReady).
	detectedContracts := instances collect: [ :i | (FogConnection currentConnection findContractBindByHash: i address blockTag: 'latest') contract ].
	self assert: detectedContracts equals: (instances collect: #contract)