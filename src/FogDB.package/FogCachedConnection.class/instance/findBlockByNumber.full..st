access db - blocks
findBlockByNumber: aBlockNumber full: aBoolean
	^  self cache 
		detectBlocks: [ :b | b number = aBlockNumber and: [ b full = aBoolean ] ]
		ifNoneCreate: [ super findBlockByNumber: aBlockNumber full: aBoolean ]