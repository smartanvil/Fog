stream
next
	| block |
	block := self connection findBlockByNumber: self currentBlockNumber full: true.
	self updateCurrentBlockNumber.
	^ block.