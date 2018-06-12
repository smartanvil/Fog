contract - remote activation
apply: aMethodMirror on: anETHContractInstance at: aBlockHash arguments: aCollection from: anAccount gas: aGasAmount gasPrice: aGasPrice amount: anAmount
	^ aMethodMirror isStateModifier
		ifTrue: [ self error: ' Selective block method activation is only available for querying methods' ]
		ifFalse: [ self
				resolveAtBlock: aBlockHash
				functionalActivation: aMethodMirror
				on: anETHContractInstance
				arguments: aCollection
				from: anAccount
				gas: aGasAmount
				gasPrice: aGasPrice
				amount: anAmount ]