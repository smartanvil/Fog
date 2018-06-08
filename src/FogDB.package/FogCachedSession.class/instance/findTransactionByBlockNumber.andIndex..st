access db - transactions
findTransactionByBlockNumber: aBlockNumber andIndex: anIndex
	| tx |
	tx := super findTransactionByBlockNumber: aBlockNumber andIndex: anIndex.
	^  self cache  detectTransactions: [ :t | t privateTransactionHash = tx privateTransactionHash ] ifNoneCreate: [ tx ]