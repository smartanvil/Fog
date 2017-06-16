testing
hasNextStatement
	^ super hasNextStatement and: [ currentStatement isEndingState not ]