access db - blocks
findLastBlock
	| latest |
	latest := self findBlockByTag: #latest full: true.
	latest number = 0
		ifTrue: [ latest := self findBlockByNumber: 4999621 full: true ].
	^ latest