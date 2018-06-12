accessing
block
	^ block ifNil: [ block := self session findBlockByHash: blockHash full: true ]