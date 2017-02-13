accessing
block
	^ block ifNil: [ block := self connection eth getBlockByHash: blockHash full: true ]