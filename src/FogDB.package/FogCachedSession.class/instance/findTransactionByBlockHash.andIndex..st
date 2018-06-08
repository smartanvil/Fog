access db - transactions
findTransactionByBlockHash: aBlockHash andIndex: aTxIndex
	| tx |
	tx := super findTransactionByBlockHash: aBlockHash andIndex: aTxIndex.
	^  self cache  detectTransactions: [ :t | t privateTransactionHash = tx privateTransactionHash ] ifNoneCreate: [ tx ]