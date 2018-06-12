as yet unclassified
applyOn: anETHContractInstance valueWithArguments: aCollection from: anAccount gas: aGasAmount gasPrice: aGasPrice
	^ self
		applyOn: anETHContractInstance
		valueWithArguments: aCollection
		from: anAccount
		gas: aGasAmount
		gasPrice: aGasPrice
		amount: 0