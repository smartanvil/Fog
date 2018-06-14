access db - contract
registerInstantiationWithReceipt: transactionHash ofContractDescription: aContractDescription
	| contractInstance future |
	contractInstance := self createContractBindFor: aContractDescription at: nil.
	future := self receiptFor: transactionHash.
	future onSuccessDo: [ :receipt | contractInstance address: (receipt at: #contractAddress) ].
	^ contractInstance