as yet unclassified
using: aSession applyOn: aContractDescription valueWithArguments: aCollection from: anAccount gas: aGasAmount gasPrice: aGasPrice amount: anAmount
	^ aSession
		deploy: aContractDescription
		applying: self
		arguments: aCollection
		from: anAccount
		gas: aGasAmount
		gasPrice: aGasPrice
		amount: anAmount