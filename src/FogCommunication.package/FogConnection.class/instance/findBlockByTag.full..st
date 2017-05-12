access db - blocks
findBlockByTag: aTag full: aBoolean
	^ self createBlockFor: (self getBlockByTag: aTag full: aBoolean) full: aBoolean