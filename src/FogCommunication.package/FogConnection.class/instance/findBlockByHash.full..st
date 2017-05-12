access db - blocks
findBlockByHash: aBlockHash full: aBoolean
	^ self createBlockFor: (self getBlockByHash: aBlockHash full: aBoolean) full: aBoolean