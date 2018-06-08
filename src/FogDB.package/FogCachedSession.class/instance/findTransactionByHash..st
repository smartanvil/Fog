access db - transactions
findTransactionByHash: aTransactionHash
	^  self cache 
		detectTransactions: [ :t | t privateTransactionHash = aTransactionHash ]
		ifNoneCreate: [ super findTransactionByHash: aTransactionHash ]