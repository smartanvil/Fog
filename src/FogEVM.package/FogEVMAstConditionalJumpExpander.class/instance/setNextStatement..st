visiting
setNextStatement: aFogEVMAstJumpTag
	aFogEVMAstJumpTag ifNil: [ ^ self ].
	(visitedStatements includes: (generalBytecode statements indexOf: aFogEVMAstJumpTag))
		ifTrue: [ self interruptVisiting. ]
		ifFalse: [ nextNode := generalBytecode statements indexOf: aFogEVMAstJumpTag ]