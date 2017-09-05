as yet unclassified
visitCreateStatement: anEQLCreateStatementNode
	^ FogEQLNamedBuffer new
		source: (anEQLCreateStatementNode selection acceptVisitor: self);
		yourself