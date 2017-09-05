accessing
at: aHash
	^ self transform: (self connection findTransactionByHash: aHash)