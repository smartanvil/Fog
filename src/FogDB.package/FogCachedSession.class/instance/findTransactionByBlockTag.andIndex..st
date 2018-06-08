access db - transactions
findTransactionByBlockTag: aBlockTag andIndex: anIndex
	| tx |
	tx := super findTransactionByBlockTag: aBlockTag andIndex: anIndex.
	^  self cache  detectTransactions: [ :t | t privateTransactionHash = tx privateTransactionHash ] ifNoneCreate: [ tx ]