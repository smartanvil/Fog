as yet unclassified
applyOn: aContractDescription valueWithArguments: aCollection configuration: aConfigurationDictionary
	| transactionHash |
	transactionHash := self connection eth
		sendTransaction:
			(FogCallDefinition new
				load: aConfigurationDictionary;
				data: aContractDescription binary , (self encodeArguments: aCollection);
				yourself).
	^ self connection registerInstantiationWithReceipt: transactionHash ofContractDescription: aContractDescription