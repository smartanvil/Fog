contract - remote activation
apply: aMethodMirror on: anETHContractInstance arguments: aCollection from: anAccount amount: anAmount
	^ self
		apply: aMethodMirror
		on: anETHContractInstance
		arguments: aCollection
		from: anAccount
		gas: (self calculateGasAmountFor: aMethodMirror)
		gasPrice: (self calculateGasPriceFor: aMethodMirror)
		amount: anAmount