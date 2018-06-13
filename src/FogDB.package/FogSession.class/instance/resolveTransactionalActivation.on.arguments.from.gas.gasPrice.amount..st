contract - remote activation private
resolveTransactionalActivation: aMethodMirror on: anETHContractInstance arguments: aCollection from: anAccount gas: aGasAmount gasPrice: aGasPrice amount: anAmount
	^ connection eth
		sendTransaction:
			(FogCallDefinition new
				from: anAccount address;
				to: anETHContractInstance address;
				gas: aGasAmount priced: aGasPrice;
				value: anAmount;
				data: (self privateEncode: aMethodMirror arguments: aCollection);
				yourself)