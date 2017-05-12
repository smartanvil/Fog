access db - blocks
findBlockByNumber: aBlockBumber full: aBoolean
	^ self createBlockFor: (self getBlockByNumber: aBlockBumber full: aBoolean) full: aBoolean