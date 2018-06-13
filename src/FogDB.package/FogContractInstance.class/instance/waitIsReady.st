syncing
waitIsReady
	| secondsToWait |
	secondsToWait := 60.
	[ address isNil and: [ secondsToWait > 0 ] ]
		whileTrue: [ secondsToWait := secondsToWait - 1.
			1 second wait ].
	address ifNil: [ self error: 'timeout!' ]