as yet unclassified
using: aSession applyOn: anETHContractInstance valueWithArguments: aCollection from: anAccount gas: aGasAmount gasPrice: aGasPrice amount: anAmount
	^ aSession
		apply: self
		on: anETHContractInstance
		arguments: aCollection
		from: anAccount
		gas: aGasAmount
		gasPrice: aGasPrice
		amount: anAmount