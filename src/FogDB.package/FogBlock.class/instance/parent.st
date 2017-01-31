accessing
parent
	^ parent
		ifNil: [ parent := self connection eth getBlockByHash: self parentHash full: true ]