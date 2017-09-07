building
composeSource: aStream withAstNode: aFogEQLSemanticNode
	^ aFogEQLSemanticNode
		ifNil: [ aStream ]
		ifNotNil: [ (aFogEQLSemanticNode acceptVisitor: self) source: aStream ]