as yet unclassified
visitCreateStatement: anEQLCreateStatementNode
	^ FogEQLUserBufferDefinition new
		source: (anEQLCreateStatementNode selection acceptVisitor: self);
		yourself