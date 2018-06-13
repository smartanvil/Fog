as yet unclassified
using: aSession applyOn: anETHContractInstance at: aBlockHash valueWithArguments: aCollection from: anAccount
	^ aSession
		apply: self
		on: anETHContractInstance
		at: aBlockHash
		arguments: aCollection
		from: anAccount
		amount: 0