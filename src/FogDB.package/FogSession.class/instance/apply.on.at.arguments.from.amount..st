contract - remote activation
apply: aMethodMirror on: anETHContractInstance at: aBlockHash arguments: aCollection from: anAccount amount: anAmount
	^ self
		apply: aMethodMirror
		on: anETHContractInstance
		at: aBlockHash
		arguments: aCollection
		from: anAccount
		gas: (self calculateGasAmountFor: aMethodMirror)
		gasPrice: (self calculateGasPriceFor: aMethodMirror)
		amount: anAmount