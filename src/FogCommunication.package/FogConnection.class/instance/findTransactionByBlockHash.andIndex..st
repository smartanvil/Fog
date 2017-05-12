access db - transactions
findTransactionByBlockHash: aBlockHash andIndex: aTxIndex

	^ self createTransactionFor: (self eth getTransactionByBlockHash: aBlockHash andIndex: aTxIndex)