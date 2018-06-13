contract - deploying
deploy: aContractDescription applying: aConstructor arguments: aCollection from: anAccount gas: aGasAmount gasPrice: aGasPrice amount: anAmount
	| transactionHash |
	transactionHash := self connection eth
		sendTransaction:
			(FogCallDefinition new
				from: anAccount;
				gas: aGasAmount priced: aGasPrice;
				value: anAmount;
				data: (self encode: aConstructor for: aContractDescription with: aCollection);
				yourself).
	^ connection registerInstantiationWithReceipt: transactionHash ofContractDescription: aContractDescription