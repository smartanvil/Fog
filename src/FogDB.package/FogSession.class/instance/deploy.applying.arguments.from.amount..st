contract - deploying
deploy: aContractDescription applying: aConstructor arguments: aCollection from: anAccount amount: anAmount
	| transactionHash |
	transactionHash := self connection eth
		sendTransaction:
			(FogCallDefinition new
				from: anAccount;
				gas: (self calculateGasForDeploying: aContractDescription with: aConstructor)
					priced: (self calculateGasPriceForDeploying: aContractDescription with: aConstructor);
				value: anAmount;
				data: (self encode: aConstructor for: aContractDescription with: aCollection);
				yourself).
	^ connection registerInstantiationWithReceipt: transactionHash ofContractDescription: aContractDescription