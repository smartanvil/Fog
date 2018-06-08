access db - blocks
findBlockByHash: aBlockHash full: aBoolean
	^  self cache 
		detectBlocks: [ :b | b privateBlockHash = aBlockHash and: [ b isFull = aBoolean ] ]
		ifNoneCreate: [ super findBlockByHash: aBlockHash full: aBoolean ]