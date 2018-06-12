as yet unclassified
applyOn: anETHContractInstance at: aBlockHash valueWithArguments: aCollection from: anAccount 
	^ session
		apply: self
		on: anETHContractInstance
		at: aBlockHash
		arguments: aCollection
		from: anAccount
		amount: 0