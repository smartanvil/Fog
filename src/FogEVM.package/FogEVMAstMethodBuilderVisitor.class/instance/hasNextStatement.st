testing
hasNextStatement
	^ (hasEntered and: [ inMethodBody not ])
		ifTrue: [ false ]
		ifFalse: [ sequence statements size > nextNode ]