access db - blocks
findBlockByTag: aTag full: aBoolean
	^ self createBlockFor: (self eth getBlockByTag: aTag full: aBoolean) full: aBoolean
	