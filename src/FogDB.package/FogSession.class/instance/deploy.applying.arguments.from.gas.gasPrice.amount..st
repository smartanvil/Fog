contract - deploying
deploy: aContractDescription applying: aConstructor arguments: aCollection from: anAccount gas: aGasAmount gasPrice: aGasPrice amount: anAmount
	| transactionHash |
	transactionHash := connection eth
		sendTransaction:
			(FogCallDefinition new
				from: anAccount address;
				gas: aGasAmount priced: aGasPrice;
				value: anAmount;
				data: (self encode: aConstructor for: aContractDescription with: aCollection);
				yourself).
	^ self
		registerInstantiationWithReceipt: transactionHash
		ofContractDescription: aContractDescription