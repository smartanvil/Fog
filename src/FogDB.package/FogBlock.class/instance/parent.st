accessing
parent
	^ parent ifNil: [ parent := [self session findBlockByHash: self parentHash full: true ] on: Error do: [ parent := nil ]]