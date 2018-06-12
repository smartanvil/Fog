access db - external accounts
getBalance: anAddress block: aBlockNumberOrHash
	^ (connection getBalance: anAddress blockNumber: aBlockNumberOrHash) asBKNumber