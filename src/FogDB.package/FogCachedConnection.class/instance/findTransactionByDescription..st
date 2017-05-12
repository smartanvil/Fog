access db - transactions
findTransactionByDescription: aTransactionDescription
	^  self cache 
		detectTransactions: [ :t | t privateTransactionHash = (aTransactionDescription at: #hash) ]
		ifNoneCreate: [ super findTransactionByDescription: aTransactionDescription ]