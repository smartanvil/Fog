visiting
visitSequenceStatement: aFogEVMAstNode
	aFogEVMAstNode = toNode
		ifTrue: [ self halt ].
	(conditionalScope sequence statements includes: aFogEVMAstNode)
		ifFalse: [ conditionalScope sequence addStatement: aFogEVMAstNode ].
	aFogEVMAstNode accept: self