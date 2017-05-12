access db - transactions
findTransactionByHash: aTransactionHash
	^ self createTransactionFor: (self eth getTransactionByHash: aTransactionHash)