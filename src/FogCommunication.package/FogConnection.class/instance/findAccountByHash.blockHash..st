access db - accounts
findAccountByHash: aString blockHash: aBlockHash
	| block |
	block := self findBlockByHash: aBlockHash full: false.
	^ self findAccountByHash: aString blockNumber: block number