contract - remote activation
apply: aMethodMirror on: anETHContractInstance arguments: aCollection from: anAccount amount: anAmount
	^ self
		apply: aMethodMirror
		on: anETHContractInstance
		arguments: aCollection
		from: anAccount
		gas: (self calculateGasAmountFor: aMethodMirror on: anETHContractInstance)
		gasPrice: (self calculateGasPriceFor: aMethodMirror on: anETHContractInstance)
		amount: anAmount