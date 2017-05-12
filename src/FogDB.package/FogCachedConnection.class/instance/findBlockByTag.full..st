access db - blocks
findBlockByTag: aTag full: aBoolean
	| block |
	block := self findBlockByTag: aTag full: aBoolean.
	^  self cache 
		detectBlocks:
			[ :b | b privateBlockHash = block privateBlockHash and: [ b full = aBoolean ] ]
		ifNoneCreate: [ block ]