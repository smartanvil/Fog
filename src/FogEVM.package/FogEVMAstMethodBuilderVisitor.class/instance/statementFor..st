as yet unclassified
statementFor: aFogEVMAstJump
	| address |
	address := aFogEVMAstJump address isEVMMessageSend
		ifTrue: [ aFogEVMAstJump address resolve ]
		ifFalse: [ aFogEVMAstJump address literalValue asBKNumber ].
	^ sequence statements
		detect: [ :s | s isJumpDest and: [ s address asBKNumber = address ] ]
		ifNone: [ nil ]