initialization
setNextStatement: aFogEVMAstJumpTag
	aFogEVMAstJumpTag ifNil: [ ^ self ].
	(visitedStatements includes: (sequence statements indexOf: aFogEVMAstJumpTag))
		ifTrue: [ inMethodBody := false ]
		ifFalse: [ nextNode := sequence statements indexOf: aFogEVMAstJumpTag ]