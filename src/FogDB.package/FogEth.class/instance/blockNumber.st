accessing
blockNumber
	^ (self send: api messageBlockNumber) asBKNumber 
	