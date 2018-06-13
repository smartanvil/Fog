as yet unclassified
using: aSession applyOn: anETHContractInstance valueWithArguments: aCollection from: anAccount gas: aGasAmount gasPrice: aGasPrice
	^ self
		using: aSession 
		applyOn: anETHContractInstance
		valueWithArguments: aCollection
		from: anAccount
		gas: aGasAmount
		gasPrice: aGasPrice
		amount: 0