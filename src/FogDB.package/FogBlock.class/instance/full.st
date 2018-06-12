accessing
full
	^ full
		ifFalse: [ self session findBlockByHash: self privateBlockHash full: true ]
		ifTrue: [ self ]