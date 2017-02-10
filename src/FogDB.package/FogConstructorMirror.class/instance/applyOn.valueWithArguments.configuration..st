as yet unclassified
applyOn: aContractDescription valueWithArguments: aCollection configuration: aConfigurationDictionary
	| transactionHash contractInstance future |
	transactionHash := self connection eth
		sendTransaction:
			(FogCallDefinition new
				load: aConfigurationDictionary;
				data: aContractDescription binary , (self encodeArguments: aCollection);
				yourself).
	contractInstance := aContractDescription privateNew.
	future := FogTransactionMonitorService current receiptFor: transactionHash.
	contractInstance address: future.
	future andThen: [ :receipt | contractInstance address: (receipt at: #contractAddress) ].
	^ contractInstance