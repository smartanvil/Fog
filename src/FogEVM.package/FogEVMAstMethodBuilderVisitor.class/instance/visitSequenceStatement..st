visiting
visitSequenceStatement: aFogEVMAstNode
	aFogEVMAstNode = toNode
		ifTrue: [ inMethodBody := false ].
	inMethodBody := inMethodBody or: [ aFogEVMAstNode = fromNode ].
	inMethodBody
		ifTrue: [ hasEntered := true ].
	inMethodBody
		ifTrue: [ (method sequence statements includes: aFogEVMAstNode)
				ifFalse: [ (aFogEVMAstNode isConditionalJump and: [ (self isErrorHandlingJump: aFogEVMAstNode) not ])
						ifFalse: [ method sequence addStatement: aFogEVMAstNode ] ] ].
	aFogEVMAstNode accept: self