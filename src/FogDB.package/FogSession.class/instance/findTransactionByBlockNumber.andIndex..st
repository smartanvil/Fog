access db - transactions
findTransactionByBlockNumber: aBlockNumber andIndex: anIndex
	^ self
		createTransactionFor: (self eth getTransactionByBlockNumber: aBlockNumber andIndex: anIndex)