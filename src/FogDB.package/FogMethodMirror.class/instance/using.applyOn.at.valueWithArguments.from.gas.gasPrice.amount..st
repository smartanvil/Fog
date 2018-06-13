as yet unclassified
using: aSession applyOn: anETHContractInstance at: aBlockHash valueWithArguments: aCollection from: anAccount gas: aGasAmount gasPrice: aGasPrice amount: anAmount
	^ aSession
		apply: self
		on: anETHContractInstance
		at: aBlockHash
		arguments: aCollection
		from: anAccount
		gas: aGasAmount
		gasPrice: aGasPrice
		amount: anAmount