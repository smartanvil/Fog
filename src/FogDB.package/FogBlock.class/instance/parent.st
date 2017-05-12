accessing
parent
	^ parent ifNil: [ parent := self connection findBlockByHash: self parentHash full: true ]