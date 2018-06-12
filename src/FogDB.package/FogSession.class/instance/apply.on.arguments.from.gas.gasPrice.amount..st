access db - contract accounts
apply: aMethodMirror on: anETHContractInstance arguments: aCollection from: anAccount gas: aGasAmount gasPrice: aGasPrice amount: anAmount
	^ aMethodMirror isStateModifier
		ifTrue: [ self
				resolveTransactionalActivation: aMethodMirror
				on: anETHContractInstance
				arguments: aCollection
				from: anAccount
				gas: aGasAmount
				gasPrice: aGasPrice
				amount: anAmount ]
		ifFalse: [ self
				resolveFunctionalActivation: aMethodMirror
				on: anETHContractInstance
				arguments: aCollection
				from: anAccount
				gas: aGasAmount
				gasPrice: aGasPrice
				amount: anAmount ]