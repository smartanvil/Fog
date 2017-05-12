access db - transactions
findTransactionByBlockTag: aBlockTag andIndex: anIndex
	^ self
		createTransactionFor: (self eth getTransactionByBlockTag: aBlockTag andIndex: anIndex)