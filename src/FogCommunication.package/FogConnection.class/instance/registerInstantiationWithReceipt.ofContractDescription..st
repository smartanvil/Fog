access db - contract
registerInstantiationWithReceipt: transactionHash ofContractDescription: aContractDescription
	| contractInstance future |
	contractInstance := self
		createContractBindFor: aContractDescription
		at: nil.
	future := FogTransactionMonitorService current
		receiptFor: transactionHash.
	contractInstance address: future.
	future
		andThen: [ :receipt | contractInstance address: (receipt at: #contractAddress) ].
	^ contractInstance