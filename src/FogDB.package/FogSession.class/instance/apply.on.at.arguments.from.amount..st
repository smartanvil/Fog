contract - remote activation
apply: aMethodMirror on: anETHContractInstance at: aBlockHash arguments: aCollection from: anAccount amount: anAmount
	^ self
		apply: aMethodMirror
		on: anETHContractInstance
		at: aBlockHash
		arguments: aCollection
		from: anAccount
		gas: (self calculateGasAmountFor: aMethodMirror on: anETHContractInstance)
		gasPrice: (self calculateGasPriceFor: aMethodMirror on: anETHContractInstance)
		amount: anAmount