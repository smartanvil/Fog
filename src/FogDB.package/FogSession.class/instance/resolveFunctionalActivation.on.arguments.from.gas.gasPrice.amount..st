contract - remote activation private
resolveFunctionalActivation: aMethodMirror on: anETHContractInstance arguments: aCollection from: anAccount gas: aGasAmount gasPrice: aGasPrice amount: anAmount
	^ self
		resolveAtBlock: #latest
		FunctionalActivation: aMethodMirror
		on: anETHContractInstance
		arguments: aCollection
		from: anAccount
		gas: aGasAmount
		gasPrice: aGasPrice
		amount: anAmount