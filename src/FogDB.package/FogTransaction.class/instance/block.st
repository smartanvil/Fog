accessing
block
	^ block ifNil: [ block := self connection findBlockByHash: blockHash full: true ]