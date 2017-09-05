visiting
visitWhereStatement: anEQLWhereStatementNode
	^ FogEQLStreamWhere new
		filter: (anEQLWhereStatementNode expression acceptVisitor: self);
		yourself