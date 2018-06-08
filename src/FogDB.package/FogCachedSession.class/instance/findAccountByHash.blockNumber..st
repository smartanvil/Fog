access db - accounts
findAccountByHash: hashAccount blockNumber: aBlockNumber
	^ self cache
		detectAccount: [ :a | a privateAccountHash = hashAccount asAddress ]
		ifNoneCreate: [ super findAccountByHash: hashAccount blockNumber: aBlockNumber ]