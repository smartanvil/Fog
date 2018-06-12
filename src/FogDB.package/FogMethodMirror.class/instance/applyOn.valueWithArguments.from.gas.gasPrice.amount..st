as yet unclassified
applyOn: anETHContractInstance valueWithArguments: aCollection from: anAccount gas: aGasAmount gasPrice: aGasPrice amount: anAmount
	^ session
		apply: self
		on: anETHContractInstance
		arguments: aCollection
		from: anAccount
		gas: aGasAmount
		gasPrice: aGasPrice
		amount: anAmount