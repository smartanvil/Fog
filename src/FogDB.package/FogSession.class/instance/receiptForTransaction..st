contract - deploying
receiptForTransaction: aTransactionHash
	^ connection eth getTransactionReceipt: aTransactionHash