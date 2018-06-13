as yet unclassified
applyOn: aContractDescription valueWithArguments: aCollection from: anAccount gas: aGasAmount gasPrice: aGasPrice amount: anAmount
	^ session
		deploy: aContractDescription
		applying: self
		arguments: aCollection
		from: anAccount
		gas: aGasAmount
		gasPrice: aGasPrice
		amount: anAmount