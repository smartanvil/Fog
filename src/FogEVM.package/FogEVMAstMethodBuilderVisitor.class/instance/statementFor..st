as yet unclassified
statementFor: aFogEVMAstJump
	| address |
	address := aFogEVMAstJump address isEVMLiteral
		ifTrue: [ aFogEVMAstJump address literalValue asBKNumber ]
		ifFalse: [ aFogEVMAstJump address resolve ].
	^ sequence statements
		detect: [ :s | s isJumpDest and: [ s address asBKNumber = address ] ]
		ifNone: [ nil ]