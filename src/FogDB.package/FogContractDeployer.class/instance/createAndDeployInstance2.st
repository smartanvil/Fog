as yet unclassified
createAndDeployInstance2
	| transactionHash contractInstance future |
	transactionHash := self connection eth
		sendTransaction:
			(FogCallDefinition new
				from: owner address;
				gas: 3000000 priced: 0;
				data: contract binary , self encodedArguments;
				yourself).
	contractInstance := contract privateNew.
	future := FogTransactionMonitorService current
		receiptFor: transactionHash.
	contractInstance address: future.
	future
		andThen: [ :receipt | contractInstance address: (receipt at: #contractAddress) ].
	^ contractInstance