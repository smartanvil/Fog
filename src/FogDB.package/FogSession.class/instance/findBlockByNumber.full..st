access db - blocks
findBlockByNumber: aBlockBumber full: aBoolean
	^ self createBlockFor: (self eth getBlockByNumber: aBlockBumber full: aBoolean) full: aBoolean