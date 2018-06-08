access db - blocks
findBlockByHash: aBlockHash full: aBoolean
	^ self createBlockFor: (self eth getBlockByHash: aBlockHash full: aBoolean) full: aBoolean