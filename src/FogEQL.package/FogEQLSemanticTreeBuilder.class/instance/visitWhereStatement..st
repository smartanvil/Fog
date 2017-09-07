visiting
visitWhereStatement: anEQLWhereStatementNode
	^ FogEQLWhere new
		filter: (anEQLWhereStatementNode expression acceptVisitor: self);
		yourself