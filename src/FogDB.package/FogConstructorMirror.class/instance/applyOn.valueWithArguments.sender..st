as yet unclassified
applyOn: aContractDescription valueWithArguments: aCollection sender: anAccount
	| transactionHash contractInstance future |
	transactionHash := self connection eth
		sendTransaction:
			(FogCallDefinition new
				from: anAccount address;
				gas: 3000000 priced: 0;
				data: aContractDescription binary , (2 asBKHexa: 64) , (self encodeArguments: aCollection);
				yourself).
	contractInstance := aContractDescription privateNew.
	future := FogTransactionMonitorService current receiptFor: transactionHash.
	contractInstance address: future.
	future andThen: [ :receipt | contractInstance address: (receipt at: #contractAddress) ].
	^ contractInstance