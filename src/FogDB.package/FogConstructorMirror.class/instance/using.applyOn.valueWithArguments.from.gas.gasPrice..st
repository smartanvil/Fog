as yet unclassified
using: aSession applyOn: aContractDescription valueWithArguments: aCollection from: anAccount gas: aGasAmount gasPrice: aGasPrice
	^ self
		using: aSession
		applyOn: aContractDescription
		valueWithArguments: aCollection
		from: anAccount
		gas: aGasAmount
		gasPrice: aGasPrice
		amount: 0