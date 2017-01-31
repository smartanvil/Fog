accessing
full
	^ full
		ifFalse: [ self connection eth getBlockByHash: self privateBlockHash full: true ]
		ifTrue: [ self ]