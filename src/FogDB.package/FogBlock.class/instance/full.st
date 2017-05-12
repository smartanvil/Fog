accessing
full
	^ full
		ifFalse: [ self connection findBlockByHash: self privateBlockHash full: true ]
		ifTrue: [ self ]