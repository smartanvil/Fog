contract - remote activation
resolveAtBlock: aBlockHash functionalActivation: aMethodMirror on: anETHContractInstance arguments: aCollection from: anAccount gas: aGasAmount gasPrice: aGasPrice amount: anAmount
	| returnValue |
	returnValue := connection eth
		call:
			(FogCallDefinition new
				from: anAccount address;
				to: anETHContractInstance address;
				gas: aGasAmount priced: aGasPrice;
				data: (self privateEncode: aMethodMirror arguments: aCollection);
				value: anAmount yourself)
		block: aBlockHash.
	^ self privateDecode: returnValue for: aMethodMirror